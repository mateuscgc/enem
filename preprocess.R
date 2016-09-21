source("detect_remove_outliers.R")
source("conditions.R")
source("numeric.R")

# Read data
dados <- read.table("./data/ENEM_LEVE.csv", sep=",", header=TRUE)

dados <- remove_outliers(dados, "IDADE", TRUE)
dados <- conditions_satisfied(dados, "IN_BRAILLE", c("IN_CEGUEIRA", "IN_SURDO_CEGUEIRA"), TRUE)
dados <- numeric_columns(dados, "ANO_CONCLUIU", 0, TRUE)

write.table(dados, "./processed/preprocessed.csv", append = FALSE, sep = ",", row.names = FALSE)
