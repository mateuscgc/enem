# This script replaces invalid (non numeric) values from numeric columns with a default value

# dados <- read.table("./data/ENEM_LEVE.csv", sep=",", header=TRUE)

numeric_column <- function(dados, target, default, log=FALSE) {

  dados[,target] <- sapply(dados[,target], as.character)

  # Get the records that has invalid values
  if(log) {
    print(dados[is.na(as.numeric(as.character(dados[, target]))), c("NU_INSCRICAO", target)])
  }

  # Really necessary part
  # Replace the records that has invalid values
  dados[is.na(as.numeric(as.character(dados[, target]))), target] <- default

  # print(dados[is.na(as.numeric(as.character(dados[, target]))), target])

  # Try again to get the records that has invalid values
  if(log) {
    print(dados[is.na(as.numeric(as.character(dados[, target]))), c("NU_INSCRICAO", target)])
  }

  return(dados)
}

# must_be_numeric <- c(
#   c("ANO_CONCLUIU", -1),
#   c("TP_ESCOLA", 0)
# )
#
# numeric_columns <- function(dados) return(Reduce(function(d, x) {
#   return(numeric_column(d, x[0], x[1]))
# }, must_be_numeric, dados))
