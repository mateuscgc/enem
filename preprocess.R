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

#dados <- remove_outliers(dados, "IDADE", TRUE)
#dados <- check_all_conditions(dados)

dados <- check_conditions(dados, "IN_LEDOR", c("IN_BAIXA_VISAO", "IN_CEGUEIRA", "IN_DEFICIENCIA_MENTAL", "IN_SURDO_CEGUEIRA", "IN_AUTISMO", "IN_DEFICIT_ATENCAO", "IN_DISLEXIA"), log=FALSE)
dados <- check_conditions(dados, "IN_TRANSCRICAO", c("IN_BAIXA_VISAO", "IN_CEGUEIRA", "IN_DEFICIENCIA_FISICA", "IN_DEFICIENCIA_MENTAL", "IN_SURDO_CEGUEIRA", "IN_AUTISMO", "IN_DEFICIT_ATENCAO", "IN_DISLEXIA"), log=FALSE)
dados <- check_conditions(dados, "IN_AMPLIADA", c("IN_BAIXA_VISAO", "IN_SURDO_CEGUEIRA"), log=FALSE)
dados <- check_conditions(dados, "IN_ACESSO", c("IN_BAIXA_VISAO", "IN_CEGUEIRA", "IN_DEFICIENCIA_FISICA", "IN_DEFICIENCIA_MENTAL", "IN_SURDO_CEGUEIRA", "IN_GESTANTE", "IN_LACTANTE", "IN_IDOSO"), log=FALSE)
dados <- check_conditions(dados, "IN_BRAILLE", c("IN_CEGUEIRA", "IN_SURDO_CEGUEIRA"), log=FALSE)
dados <- check_conditions(dados, "IN_MESA_CADEIRA_SEPARADA", c("IN_DEFICIENCIA_FISICA", "IN_GESTANTE", "IN_LACTANTE"), log=FALSE)
dados <- check_conditions(dados, "IN_MESA_CADEIRA_RODAS", c("IN_DEFICIENCIA_FISICA", "IN_GESTANTE", "IN_LACTANTE"), log=FALSE)
dados <- check_conditions(dados, "IN_APOIO_PERNA", c("IN_DEFICIENCIA_FISICA"), log=FALSE)
dados <- check_conditions(dados, "IN_LEITURA_LABIAL", c("IN_DEFICIENCIA_MENTAL", "IN_SURDEZ", "IN_SURDO_CEGUEIRA"), log=FALSE)
dados <- check_conditions(dados, "IN_LIBRAS", c("IN_SURDEZ", "IN_SURDO_CEGUEIRA"), log=FALSE)
dados <- check_conditions(dados, "IN_GUIA_INTERPRETE", c("IN_SURDO_CEGUEIRA"), log=FALSE)

  # all_conditions <- c(
  #   c("IN_LEDOR", c("IN_BAIXA_VISAO", "IN_CEGUEIRA", "IN_DEFICIENCIA_MENTAL", "IN_SURDO_CEGUEIRA", "IN_AUTISMO", "IN_DEFICIT_ATENCAO", "IN_DISLEXIA")),
  #   c("IN_TRANSCRICAO", c("IN_BAIXA_VISAO", "IN_CEGUEIRA", "IN_DEFICIENCIA_FISICA", "IN_DEFICIENCIA_MENTAL", "IN_SURDO_CEGUEIRA", "IN_AUTISMO", "IN_DEFICIT_ATENCAO", "IN_DISLEXIA")),
  #   c("IN_AMPLIADA", c("IN_BAIXA_VISAO", "IN_SURDO_CEGUEIRA")),
  #   c("IN_ACESSO", c("IN_BAIXA_VISAO", "IN_CEGUEIRA", "IN_DEFICIENCIA_FISICA", "IN_DEFICIENCIA_MENTAL", "IN_SURDO_CEGUEIRA", "IN_GESTANTE", "IN_LACTANTE", "IN_IDOSO")),
  #   c("IN_BRAILLE", c("IN_CEGUEIRA", "IN_SURDO_CEGUEIRA")),
  #   c("IN_MESA_CADEIRA_SEPARADA", c("IN_DEFICIENCIA_FISICA", "IN_GESTANTE", "IN_LACTANTE")),
  #   c("IN_MESA_CADEIRA_RODAS", c("IN_DEFICIENCIA_FISICA", "IN_GESTANTE", "IN_LACTANTE")),
  #   c("IN_APOIO_PERNA", c("IN_DEFICIENCIA_FISICA")),
  #   c("IN_LEITURA_LABIAL", c("IN_DEFICIENCIA_MENTAL", "IN_SURDEZ", "IN_SURDO_CEGUEIRA")),
  #   c("IN_LIBRAS", c("IN_SURDEZ", "IN_SURDO_CEGUEIRA")),
  #   c("IN_GUIA_INTERPRETE", c("IN_SURDO_CEGUEIRA"))
  # )

dados <- numeric_column(dados, "ANO_CONCLUIU", 0, log=TRUE)
dados <- numeric_column(dados, "TP_ESCOLA", -1, log=TRUE)
#CONTINUA...

#dados <- eraseColumns(dados,unnecessary,1)
#dados <- age(dados)

write.table(dados, "./processed/processed.csv", append = FALSE, sep = ",", row.names = FALSE)
