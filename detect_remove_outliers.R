# This script removes outilers (entire row) for the target column
# New outliers may appear after removal

dados <- read.table("./data/ENEM_LEVE.csv", sep=",", header=TRUE)

target <- "IDADE"

target_only <- dados[!is.na(as.numeric(as.character(dados[, target]))), target]

# Calculates limits
dist <- boxplot(na.omit(as.numeric(as.character(target_only))), main="", xlab="", ylab=target, plot=FALSE)

# Removes records that are outliers
min_non_outlier <- dist$stats[1,]
max_non_outlier <- dist$stats[5,]
dados <- dados[dados[,target] >= min_non_outlier & dados[,target] <= max_non_outlier,]

# Verifies
target_only <- dados[!is.na(as.numeric(as.character(dados[, target]))), target]
boxplot(na.omit(as.numeric(as.character(target_only))), main="", xlab="", ylab=target, plot=TRUE)
