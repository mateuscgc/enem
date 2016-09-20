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
