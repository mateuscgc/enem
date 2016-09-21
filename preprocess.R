source("detect_remove_outliers.R")
source("conditions.R")
source("numeric.R")
source("age.R")
source("rmCollumn.R")

# Read data
dados <- read.table("./data/ENEM_LEVE.csv", sep=",", header=TRUE)

unnecessary = c("TP_COR_RACA","TP_ESTADO_CIVIL",
                "COD_MUNICIPIO_INSC","NO_ENTIDADE_CERTIFICACAO","PK_COD_ENTIDADE",
                "NO_MUNICIPIO_INSC","IN_UNIDADE_HOSPITALAR")

dados <- remove_outliers(dados, "IDADE", TRUE)
dados <- conditions_satisfied(dados, "IN_BRAILLE", c("IN_CEGUEIRA", "IN_SURDO_CEGUEIRA"), TRUE)
dados <- numeric_columns(dados, "ANO_CONCLUIU", 0, TRUE)
dados <- eraseColumns(dados,unnecessary,1)
dados <- age(dados)

write.table(dados, "./processed/preprocessed.csv", append = FALSE, sep = ",", row.names = FALSE)
