check_conditions <- function(dados, conditioned, conditions){
  replacement <- 0
  if(length(conditions) == 1){

    dados[ as.numeric(as.character(dados[, conditioned])) == 1
           & dados[conditions[0]] == 0
           , conditioned] <- replacement
    return(dados)
  }else{
    # Really necessary part
    # Replace the records that do not fit the conditions
    dados[ as.numeric(as.character(dados[, conditioned])) == 1
           & rowSums(dados[, conditions], na.rm = TRUE) == 0
           , conditioned] <- replacement

    return(dados)
  }
}


all_conditions <- c(
  c("IN_LEDOR", c("IN_BAIXA_VISAO", "IN_CEGUEIRA", "IN_DEFICIENCIA_MENTAL", "IN_SURDO_CEGUEIRA", "IN_AUTISMO", "IN_DEFICIT_ATENCAO", "IN_DISLEXIA")),
  c("IN_TRANSCRICAO", c("IN_BAIXA_VISAO", "IN_CEGUEIRA", "IN_DEFICIENCIA_FISICA", "IN_DEFICIENCIA_MENTAL", "IN_SURDO_CEGUEIRA", "IN_AUTISMO", "IN_DEFICIT_ATENCAO", "IN_DISLEXIA")),
  c("IN_AMPLIADA", c("IN_BAIXA_VISAO", "IN_SURDO_CEGUEIRA")),
  c("IN_ACESSO", c("IN_BAIXA_VISAO", "IN_CEGUEIRA", "IN_DEFICIENCIA_FISICA", "IN_DEFICIENCIA_MENTAL", "IN_SURDO_CEGUEIRA", "IN_GESTANTE", "IN_LACTANTE", "IN_IDOSO")),
  c("IN_BRAILLE", c("IN_CEGUEIRA", "IN_SURDO_CEGUEIRA")),
  c("IN_MESA_CADEIRA_SEPARADA", c("IN_DEFICIENCIA_FISICA", "IN_GESTANTE", "IN_LACTANTE")),
  c("IN_MESA_CADEIRA_RODAS", c("IN_DEFICIENCIA_FISICA", "IN_GESTANTE", "IN_LACTANTE")),
  c("IN_APOIO_PERNA", c("IN_DEFICIENCIA_FISICA")),
  c("IN_LEITURA_LABIAL", c("IN_DEFICIENCIA_MENTAL", "IN_SURDEZ", "IN_SURDO_CEGUEIRA")),
  c("IN_LIBRAS", c("IN_SURDEZ", "IN_SURDO_CEGUEIRA")),
  c("IN_GUIA_INTERPRETE", c("IN_SURDO_CEGUEIRA"))
)

check_all_conditions <- function(dados) return(Reduce(function(d, x) {
  check_conditions(d, x[0], x[1])
}, all_conditions, dados))

dados <- read.table("./data/ENEM_LEVE.csv", sep=",", header=TRUE)
write.table(check_all_conditions(dados), "./processed/conditions.csv", sep=",", append=FALSE, row.names=FALSE)
