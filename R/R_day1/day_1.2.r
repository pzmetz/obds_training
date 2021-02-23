data_1 <- read.table("C:\\R\\coding_gene_region.bed",
                     header = FALSE, sep = "\t")                      
dim(data_1)
colnames(data_1) <- c("chrom", "start", "end", "gene", "score", "strand")
head(data_1)

#3. Add a new column containing the length of each 
#genomic interval and sort this column from largest to 
#smallest using a base R function

data_1$interval <- data_1$end -data_1$start
data_1

ordered_table_1 <- data_1[order(data_1$interval, decreasing = TRUE),]
head(ordered_table_1)

#4. Extract the element at row 30, column 3

ordered_table_1[30,3]

#5. Extract the second column by index and by name 
#(using both [] and $ )

head(ordered_table_1[,2])
head(ordered_table_1["start"])

#6. On which chromosome is the largest interval? Output just the
#chromosome value and store in the variable max_chrom

max(ordered_table_1["interval"])
max_chrom <- ordered_table_1[1,1]
max_chrom

#7. Subset the data frame to contain only regions with a length from
#100,001-200,000 bp - assign to a new variable. Write your subset
#data frame to a tab separated file(include 
                                   comuln names but not row names)

newdata <- subset(ordered_table_1, ordered_table_1$interval >= 100001 & ordered_table_1$interval <= 200000)
newdata
write.table(newdata,
            "subset_length.txt",
            sep = "\t",
            quote = FALSE,
            row.names = FALSE,
            col.names = TRUE)

#8. In the original data frame, replace the score value with 100 for
#genomic intervals on chr4 or chr17 that are on the + strand and
#longer than 200,000 bp. Count the number of regions that have a
#score of 100.

ordered_table_1$score[ordered_table_1$chrom %in% c("chr4", "chr17") & ordered_table_1$strand == "+" & ordered_table_1$interval > 200000] <- 100
summary(ordered_table_1$score)
nrow(ordered_table_1[ordered_table_1$score == "100",])

View(ordered_table_1)

#9. Add a new row to the original data frame - you can make up the
#values. Make sure the class of each variable in the data frame is
#correct.

newrow <- list("chrZ", 00000, 999999999, "yeet", 9000, "-", 9999999999)
newdata_2 = rbind(data_1, newrow)
tail(newdata_2)
class(newdata_2)

#10. Remove the score variable from the data frame

newdata_2[,c(1:4, 6)]

#11

#apply(ordered_table_1, 2, range(x))

apply(newdata_2, 2, function(x) range(x, na.rm = TRUE, finite = TRUE))

#1

colours_vector <- c("red", "orange", "purple", "yellow", "pink", "blue", "red", "Bordeaux")
for (color in colours_vector){
  if (nchar(color) == 4){
    print(color)
  }
}

#2. Write a loop to print out the colours at even 
#positions of the colours_vector (loop should 
#work for a vector of any length)

colours_vector[seq(2, length(colours_vector), by = 2)]

for (even_position in seq(2, length(colours_vector), by = 2)){
  print(colours_vector[even_position])
}

#1. Write a function that uses a for loop to calculate the mean of a
#numeric vector of any length (use of the mean() function is banned

sum <- 0
index <- 0
numeric_vector <- c(8, 8, 8, 8, 9, 7)

for (number in numeric_vector){
  sum <-  sum + number
  index <- index + 1
  if (index == length(numeric_vector)){
    print(sum/length(numeric_vector))
  }
}

2. Write a function that returns the colour name and the number of
vowels it contains, but only for elements in colours_vector with fewer
than six characters





