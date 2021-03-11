library(DropletUtils)
library(scater)
library(scran)
library(batchelor)
library(Seurat)

# Import datasets ----

sce <- DropletUtils::read10xCounts(samples = c(
    "v2" = "data/integration/pbmc_1k_v2",
    "v3" = "data/integration/pbmc_1k_v3"
))

sce <- scater::logNormCounts(sce)

dec <- scran::modelGeneVar(sce)
hvgs <- scran::getTopHVGs(dec, prop = 0.1)

# Using RandomParam() as it is more efficient for file-backed matrices.

set.seed(0010101010)
sce <- runPCA(sce, subset_row=hvgs,
              BSPARAM=BiocSingular::RandomParam())

g <- buildSNNGraph(sce, k=10, use.dimred='PCA')
clust <- igraph::cluster_walktrap(g)$membership
sce$SNN <- factor(clust)

# tSNE
set.seed(1111001)
sce <- runTSNE(sce, dimred="PCA")
plotTSNE(sce, colour_by="Sample")

# UMAP
set.seed(1111001)
sce <- runUMAP(sce, dimred="PCA")
plotUMAP(sce, colour_by="Sample")

# Linear regression ----

sce_v2 <- sce[, sce$Sample == "v2"]
sce_v3 <- sce[, sce$Sample == "v3"]

# lognormalise each batch to prior to rescaleBatches

sce_v2 <- logNormCounts(sce_v2)
sce_v3 <- logNormCounts(sce_v3)

sce_rescaled <- rescaleBatches(sce_v2, sce_v3)

#--- variance-modelling ---#
sce_rescaled.dec <- modelGeneVar(sce_rescaled, assay.type = "corrected")
sce_rescaled.hvgs <- getTopHVGs(sce_rescaled.dec, prop = 0.1)

set.seed(1010101010) # To ensure reproducibility of IRLBA.
sce_rescaled <- runPCA(sce_rescaled, subset_row=sce_rescaled.hvgs, exprs_values="corrected")

sce_rescaled.g <- buildSNNGraph(sce_rescaled, use.dimred="PCA")
clusters.resc <- igraph::cluster_walktrap(sce_rescaled.g)$membership
tab.resc <- table(Cluster=clusters.resc, Batch=sce_rescaled$batch)
tab.resc

set.seed(1111001)
sce_rescaled <- runUMAP(sce_rescaled, dimred="PCA")
rescaled$batch <- factor(rescaled$batch)
plotUMAP(rescaled, colour_by="batch")

# Seurat SCTransform ----

v2_mat <- assay(sce_v2, "counts")
v3_mat <- assay(sce_v3, "counts")

colnames(v2_mat) <- paste0("v2-", seq_len(ncol(v2_mat)))
colnames(v3_mat) <- paste0("v3-", seq_len(ncol(v3_mat)))

pbmc.list <- list(
    v2 = CreateSeuratObject(v2_mat, "v2"),
    v3 = CreateSeuratObject(v3_mat, "v3")
)

for (i in 1:length(pbmc.list)) {
    pbmc.list[[i]] <- SCTransform(pbmc.list[[i]], verbose = FALSE)
}

pbmc.features <- SelectIntegrationFeatures(
    object.list = pbmc.list, nfeatures = 3000)
pbmc.list <- PrepSCTIntegration(
    object.list = pbmc.list, anchor.features = pbmc.features, verbose = TRUE)

pbmc.anchors <- FindIntegrationAnchors(
    object.list = pbmc.list, normalization.method = "SCT", anchor.features = pbmc.features,
    verbose = TRUE)
pbmc.integrated <- IntegrateData(
    anchorset = pbmc.anchors, normalization.method = "SCT",
    verbose = FALSE)

set.seed(1111001)
pbmc.integrated <- RunPCA(pbmc.integrated, verbose = TRUE)
pbmc.integrated <- RunUMAP(pbmc.integrated, dims = 1:30)
pbmc.integrated <- pbmc.integrated[, sample(ncol(pbmc.integrated))]
DimPlot(pbmc.integrated, group.by = "orig.ident")

DimPlot(pbmc.integrated, group.by = "orig.ident", split.by = "orig.ident")

keep_v2 <- which(pbmc.integrated$orig.ident == "v2")
keep_v3 <- sample(which(pbmc.integrated$orig.ident == "v3"), length(keep_v2))

pbmc.integrated.ds <- pbmc.integrated[, c(keep_v2, keep_v3)]
DimPlot(pbmc.integrated.ds, group.by = "orig.ident", split.by = "orig.ident")
