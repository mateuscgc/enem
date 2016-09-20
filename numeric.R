# This script replaces invalid (non numeric) values from numeric columns with a default value

dados <- read.table("./data/ENEM_LEVE.csv", sep=",", header=TRUE)

target <- "ANO_CONCLUIU"
default <- 0

dados[,target] <- sapply(dados[,target], as.character)

# Get the records that has invalid values
dados[is.na(as.numeric(as.character(dados[, target]))), c("NU_INSCRICAO", target)]

# Really necessary part
# Replace the records that has invalid values
dados[is.na(as.numeric(as.character(dados[, target]))), target] <- default

# Try again to get the records that has invalid values
dados[is.na(as.numeric(as.character(dados[, target]))), c("NU_INSCRICAO", target)]
