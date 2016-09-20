dados <- read.table("./data/ENEM_LEVE.csv", sep=",", header=TRUE)

conditioned <- "IN_BRAILLE"
conditions <- c("IN_CEGUEIRA", "IN_BAIXA_VISAO")

# Get the records that do not fit the conditions
dados[ as.numeric(as.character(dados[, conditioned])) == 1
                  & rowSums(dados[, conditions], na.rm = TRUE) == 0
                  , c(conditions, conditioned)]

replacement <- 0

# Really necessary part
# Replace the records that do not fit the conditions
dados[ as.numeric(as.character(dados[, conditioned])) == 1
       & rowSums(dados[, conditions], na.rm = TRUE) == 0
       , conditioned] <- replacement


# Try again to get the records that do not fit the conditions
dados[ as.numeric(as.character(dados[, conditioned])) == 1
       & rowSums(dados[, conditions], na.rm = TRUE) == 0
       , c(conditions, conditioned)]


# write.table(dados, "./processed/braille.csv", append = FALSE, sep = ",")


#### Summary of conditions ####
# "IN_LEDOR" ==> c("IN_BAIXA_VISAO", "IN_CEGUEIRA", "IN_DEFICIENCIA_MENTAL", "IN_SURDO_CEGUEIRA", "IN_AUTISMO", "IN_DEFICIT_ATENCAO", "IN_DISLEXIA")
# "IN_TRANSCRICAO" ==> c("IN_BAIXA_VISAO", "IN_CEGUEIRA", "IN_DEFICIENCIA_FISICA", "IN_DEFICIENCIA_MENTAL", "IN_SURDO_CEGUEIRA", "IN_AUTISMO", "IN_DEFICIT_ATENCAO", "IN_DISLEXIA")
# "IN_AMPLIADA" ==> c("IN_BAIXA_VISAO", "IN_SURDO_CEGUEIRA")
# "IN_ACESSO" ==> c("IN_BAIXA_VISAO", "IN_CEGUEIRA", "IN_DEFICIENCIA_FISICA", "IN_DEFICIENCIA_MENTAL", "IN_SURDO_CEGUEIRA", "IN_GESTANTE", "IN_LACTANTE", "IN_IDOSO")
# "IN_BRAILLE" ==> c("IN_CEGUEIRA", "IN_SURDO_CEGUEIRA")
# "IN_MESA_CADEIRA_SEPARADA" ==> c("IN_DEFICIENCIA_FISICA", "IN_GESTANTE", "IN_LACTANTE")
# "IN_MESA_CADEIRA_RODAS" ==> c("IN_DEFICIENCIA_FISICA", "IN_GESTANTE", "IN_LACTANTE")
# "IN_APOIO_PERNA" ==> c("IN_DEFICIENCIA_FISICA")
# "IN_LEITURA_LABIAL" ==> c("IN_DEFICIENCIA_MENTAL", "IN_SURDEZ", "IN_SURDO_CEGUEIRA")
# "IN_LIBRAS" ==> c("IN_SURDEZ", "IN_SURDO_CEGUEIRA")
# "IN_GUIA_INTERPRETE" ==> c("IN_SURDO_CEGUEIRA")
