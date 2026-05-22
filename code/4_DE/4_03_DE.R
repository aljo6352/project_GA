library(DESeq2)
library(ggplot2)

setwd("C:/Users/alexj/Desktop/Genome Analysis spring 26")

counts <- read.table("4_02_counts.txt", header = TRUE, sep="\t", 
                   colClasses = c("character", "NULL", "NULL", "NULL", "NULL", "NULL", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

coldata <- data.frame(condition = factor(c("C", "T", "C", "T", "C", "T")))

#histogram of expression counts
ggplot(counts) +
  geom_histogram(aes(x = control1), stat = "bin", bins = 200, color="blue") + 
  geom_histogram(aes(x = control2), stat = "bin", bins = 200, color="green") +
  geom_histogram(aes(x = control3), stat = "bin", bins = 200, color="red") +
  geom_histogram(aes(x = treated1), stat = "bin", bins = 200, color="orange") +
  geom_histogram(aes(x = treated2), stat = "bin", bins = 200, color="white") +
  geom_histogram(aes(x = treated3), stat = "bin", bins = 200, color="pink") +
  xlab("Raw expression counts") +
  ylab("Number of genes")

#now i want to find out how many genes are not expressed at all in each sample.
samples <- c("control1", "treated1", "control2", "treated2", "control3", "treated3")
not_expressed <- list()

for (u in samples) {
  number_notexpressed <- 0 
  for (i in rownames(counts)){
    if (counts[i,u]==0){
      number_notexpressed <- number_notexpressed+1
    }
  }
  not_expressed <- c(not_expressed, number_notexpressed) #the list wont have the sample name but its fine
}

#here the DEanalysis starts 

dds <- DESeqDataSetFromMatrix(countData = counts, colData = coldata, design = ~ condition, tidy=TRUE)
dds <- DESeq(dds)

res <- results(dds)
print(summary(res))

#plotMA(res)

# PCA plot
vsd <- vst(dds, blind = TRUE)  # variance-stabilizing transformation
plotPCA(vsd, intgroup = "condition")

## code for tresholds and volcano plot are based on https://omicstutorials.com/creating-a-volcano-plot-from-deseq2-analysis/

## Here we edit the results to make all NA values for Log2FC and padj not matter for further analysis:
res_df <- as.data.frame(res)
res_df$log2FoldChange[is.na(res_df$log2FoldChange)] <- 0 # we will look for values that are far from 0 in the log2FC
res_df$padj[is.na(res_df$padj)] <- 1 # we will look for the lowest padj for further analysis so assigning these to 1 won´t affect that

# Thresholds for up/down-regulated genes
log2FC_threshold <- 2
pval_threshold <- 0.05
res_df$significance <- ifelse(
  res_df$padj < pval_threshold & res_df$log2FoldChange > log2FC_threshold, "Upregulated",
  ifelse(res_df$padj < pval_threshold & res_df$log2FoldChange < -log2FC_threshold, "Downregulated", "Not Significant \n(p>0.05, L2F<2)")
)

# now we can make the volcano plot with these thresholds to color interesting genes.

ggplot(res_df, aes(x = log2FoldChange, y = -log10(padj), color = significance)) +
  geom_point(size=1) +
  scale_color_manual(values = c("darkblue", "grey", "darkorange")) +
  labs(x = "Log2 Fold Change",
       y = "-Log10 Adjusted P-Value")

##counting up and down regulated genes

upreg <- 0
downreg <- 0

for (i in rownames(res_df)){
  if (res_df[i, "significance"]=="Upregulated"){
    upreg <- upreg+1
  }
  if (res_df[i, "significance"]=="Downregulated"){
    downreg <- downreg+1
  }
}

#making an output file with just the upregulated genes

upreg_file <- res_df[grepl('Upregulated', res_df$significance),]
write.table(upreg_file[1:6], file ="upregulated.txt", sep = "\t", row.names = TRUE, quote = FALSE)

#making an output file with just the downregulated genes

downreg_file <- res_df[grepl('Downregulated', res_df$significance),]
write.table(downreg_file[1:6], file ="downregulated.txt", sep = "\t", row.names = TRUE, quote = FALSE)

