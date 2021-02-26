#---------------------------------------------------

#For each gene (i.e. row) in logcounts.csv , use 
#cell_metadata.csv and a statistical test of your choice 
#to identify gene differentially expressed in cells 
#infected with Salmonella relative to the control 
#uninfected cells.

#Suggestion: write the code to test one gene, refactor 
#the code into a function that returns the p-value, and 
#use vapply to apply that function to all the genes. 
#Visualise a bar plot of the p-values.

#read in data
log_counts <- read.csv("data/logcounts.csv", row.names = 1)
cell_metadata <- read.csv("data/cell_metadata.csv", row.names = 1)


#order by rownames

View(cell_metadata)

#create matrix from log_counts as this will be required for next step
log_counts = as.matrix(log_counts)

#test gene expression (of one gene) for each cell and compare between cell groups (mock or STM-LT2) with wilcox.test (non-parametric); because we cannot assume normalised data
test_row <- function(index, matrix) {
  test_data <- data.frame(
    value = as.numeric(matrix[index, ]),
    group = cell_metadata$Infection)
  out <- wilcox.test(value ~ group, test_data)
  out$p.value
  }

# create vector of indexes from all rows in log_counts
rowselect <- seq(1, nrow(log_counts))

#apply the test_row function on all rows in the log_counts dataset, giving as input: rowselect as index and log_counts as matrix. 
p_values <- vapply(rowselect, test_row, FUN.VALUE = numeric(1), matrix = log_counts)

summary(p_values)

hist(p_values)
View(log_counts)

#count p values 
counter <- 0
for (i in p_values){
  if (i < 0.05){
    counter <- counter + 1
  }
}
print(counter)

#Correct p-values for multiple testing. How many genes 
#remain before and after multiple testing? Use 
#gene_metadata.csv to get the gene name for the gene 
#identi􀃘er associated with the smallest pvalue.

#adjust p values
p_values_adjusted <- p.adjust(p_values, method = "BY")
hist(p_values_adjusted)
min(p_values_adjusted)
View(p_values)

#plot both p values and show where abouts we did cut offs
plot(p_values, p_values_adjusted)
abline(a=0, b=1)
abline(a=0.05, b=0)
abline(v=0.05)

#count p values adjusted
counter <- 0
for (i in p_values_adjusted){
  if (i < 0.05){
    counter <- counter + 1
  }
}
print(counter)

#load in gene metadata
gene_metadata <- read.csv("data/gene_metadata.csv", row.names = 1)
View(gene_metadata)

#change p-values_adjusted to dataframe
min(p_values_adjusted)
class(log_counts)
p_values_adjusted.df <- as.data.frame(p_values_adjusted)

#Use gene_metadata.csv to get the gene name 
#for the gene identi􀃘er associated with the smallest 
#pvalue.

View(gene_metadata)

ordered_gene_metadata <-cbind(rownames(gene_metadata)[order(rownames(gene_metadata))], gene_metadata[order(rownames(gene_metadata)),])
ordered_log_counts <-cbind(rownames(log_counts)[order(rownames(log_counts))], log_counts[order(rownames(log_counts)),])

#proving that not all genes have data, by showing there are some genes that have no counts, because difference in number of rows:
nrow(gene_metadata)
nrow(log_counts)

#combine dataframes and order
combined_dataframe <- merge(ordered_gene_metadata, ordered_log_counts, by=1, all=TRUE) 
View(combined_dataframe)
dataframe_gene_names_data_nonavalues <- combined_dataframe[complete.cases(combined_dataframe), ]
View(dataframe_gene_names_data_nonavalues)

#TODO: remove all rows containing zero(s) to see if below code works then.

# subset first two columns to get order of gene names and ids
gene_id_name <- combined_dataframe[,1:2]

#remove second colum from dataframe, set first colum as rownamens, then delete first column
dataframe_gene_names_data_nonavalues[,2] <- NULL
rownames(dataframe_gene_names_data_nonavalues) <- dataframe_gene_names_data_nonavalues[,1]
dataframe_gene_names_data_nonavalues[,1] <- NULL

#redefine log_counts
log_counts <- as.matrix(dataframe_gene_names_data_nonavalues)

#rerun function from before, but now redefine 
test_row <- function(index, matrix) {
  test_data <- data.frame(
    value = as.numeric(matrix[index, ]),
    group = cell_metadata$Infection)
  out <- wilcox.test(value ~ group, test_data)
  out$p.value
}

# create vector of indexes from all rows in log_counts
rowselect <- seq(1, nrow(log_counts))

#apply the test_row function on all rows in the log_counts dataset, giving as input: rowselect as index and log_counts as matrix. 
p_values <- as.matrix(vapply(rowselect, test_row, FUN.VALUE = numeric(1), matrix = log_counts))
nrow(p_values)
nrow(gene_id_name)
gene_id_name_p_values <- cbind(gene_id_name, p_values)
