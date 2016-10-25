source("detect_remove_outliers.R")
source("conditions.R")
source("numeric.R")
source("age.R")
source("rmCollumn.R")

# Read data
dados <- read.table("./data/ENEM_LEVE.csv", sep=",", header=TRUE)

unnecessary = c(
  "NU_ANO", "NO_MUNICIPIO_INSC", "UF_INSC", "TP_ESTADO_CIVIL", "IN_UNIDADE_HOSPITALAR", "NO_ENTIDADE_CERTIFICACAO",
  "UF_ENTIDADE_CERTIFICACAO", "COD_MUNICIPIO_PROVA", "NO_MUNICIPIO_PROVA", "UF_MUNICIPIO_PROVA", "TX_RESPOSTAS_CN", "TX_RESPOSTAS_CH", "TX_RESPOSTAS_LC", "TX_RESPOSTAS_MT",
  "ID_PROVA_CN", "ID_PROVA_CH", "ID_PROVA_LC", "ID_PROVA_MT", "DS_GABARITO_CN", "DS_GABARITO_CH", "DS_GABARITO_LC", "DS_GABARITO_MT",

  "IN_BAIXA_VISAO", "IN_CEGUEIRA", "IN_SURDEZ", "IN_DEFICIENCIA_AUDITIVA", "IN_SURDO_CEGUEIRA", "IN_DEFICIENCIA_FISICA",
  "IN_DEFICIENCIA_MENTAL", "IN_DEFICIT_ATENCAO", "IN_DISLEXIA", "IN_GESTANTE", "IN_LACTANTE", "IN_IDOSO", "IN_AUTISMO",
  "IN_SABATISTA", "IN_BRAILLE", "IN_AMPLIADA", "IN_LEDOR", "IN_ACESSO", "IN_TRANSCRICAO", "IN_LIBRAS", "IN_LEITURA_LABIAL",
  "IN_MESA_CADEIRA_RODAS", "IN_MESA_CADEIRA_SEPARADA", "IN_APOIO_PERNA", "IN_GUIA_INTERPRETE",
  "NU_NOTA_COMP1",
  "NU_NOTA_COMP2",
  "NU_NOTA_COMP3",
  "NU_NOTA_COMP4",
  "NU_NOTA_COMP5",
  "NU_NOTA_REDACAO"
  #"NU_NT_CN",
  #"NU_NT_CH",
  #"NU_NT_LC",
  #"NU_NT_MT"
)

dados <- eraseColumns(dados,unnecessary,1)

dados <- numeric_column(dados, "ANO_CONCLUIU", NA, log=FALSE)
dados <- numeric_column(dados, "TP_ESCOLA", NA, log=FALSE)
dados <- numeric_column(dados, "IN_TP_ENSINO", NA, log=FALSE)
dados <- numeric_column(dados, "PK_COD_ENTIDADE", NA, log=FALSE)
dados <- numeric_column(dados, "COD_MUNICIPIO_ESC", NA, log=FALSE)
dados <- numeric_column(dados, "ID_DEPENDENCIA_ADM", NA, log=FALSE)
dados <- numeric_column(dados, "ID_LOCALIZACAO", NA, log=FALSE)
dados <- numeric_column(dados, "SIT_FUNC", NA, log=FALSE)
dados <- numeric_column(dados, "NU_NT_CN", NA, log=FALSE)
dados <- numeric_column(dados, "NU_NT_CH", NA, log=FALSE)
dados <- numeric_column(dados, "NU_NT_LC", NA, log=FALSE)
dados <- numeric_column(dados, "NU_NT_MT", NA, log=FALSE)
dados <- numeric_column(dados, "TP_LINGUA", NA, log=FALSE)
dados <- numeric_column(dados, "NU_NOTA_COMP1", NA, log=FALSE)
dados <- numeric_column(dados, "NU_NOTA_COMP2", NA, log=FALSE)
dados <- numeric_column(dados, "NU_NOTA_COMP3", NA, log=FALSE)
dados <- numeric_column(dados, "NU_NOTA_COMP4", NA, log=FALSE)
dados <- numeric_column(dados, "NU_NOTA_COMP5", NA, log=FALSE)
dados <- numeric_column(dados, "NU_NOTA_REDACAO", NA, log=FALSE)

# dados <- remove_outliers(dados, "IDADE", TRUE)
dados <- remove_outliers(dados, "NU_NT_CN", TRUE)
dados <- remove_outliers(dados, "NU_NT_CH", TRUE)
dados <- remove_outliers(dados, "NU_NT_LC", TRUE)
dados <- remove_outliers(dados, "NU_NT_MT", TRUE)
dados <- remove_outliers(dados, "NU_NOTA_REDACAO", TRUE)

# dados <- check_conditions(dados, "IN_LEDOR", c("IN_BAIXA_VISAO", "IN_CEGUEIRA", "IN_DEFICIENCIA_MENTAL", "IN_SURDO_CEGUEIRA", "IN_AUTISMO", "IN_DEFICIT_ATENCAO", "IN_DISLEXIA"), log=FALSE)
# dados <- check_conditions(dados, "IN_TRANSCRICAO", c("IN_BAIXA_VISAO", "IN_CEGUEIRA", "IN_DEFICIENCIA_FISICA", "IN_DEFICIENCIA_MENTAL", "IN_SURDO_CEGUEIRA", "IN_AUTISMO", "IN_DEFICIT_ATENCAO", "IN_DISLEXIA"), log=FALSE)
# dados <- check_conditions(dados, "IN_AMPLIADA", c("IN_BAIXA_VISAO", "IN_SURDO_CEGUEIRA"), log=FALSE)
# dados <- check_conditions(dados, "IN_ACESSO", c("IN_BAIXA_VISAO", "IN_CEGUEIRA", "IN_DEFICIENCIA_FISICA", "IN_DEFICIENCIA_MENTAL", "IN_SURDO_CEGUEIRA", "IN_GESTANTE", "IN_LACTANTE", "IN_IDOSO"), log=FALSE)
# dados <- check_conditions(dados, "IN_BRAILLE", c("IN_CEGUEIRA", "IN_SURDO_CEGUEIRA"), log=FALSE)
# dados <- check_conditions(dados, "IN_MESA_CADEIRA_SEPARADA", c("IN_DEFICIENCIA_FISICA", "IN_GESTANTE", "IN_LACTANTE"), log=FALSE)
# dados <- check_conditions(dados, "IN_MESA_CADEIRA_RODAS", c("IN_DEFICIENCIA_FISICA", "IN_GESTANTE", "IN_LACTANTE"), log=FALSE)
# dados <- check_conditions(dados, "IN_APOIO_PERNA", c("IN_DEFICIENCIA_FISICA"), log=FALSE)
# dados <- check_conditions(dados, "IN_LEITURA_LABIAL", c("IN_DEFICIENCIA_MENTAL", "IN_SURDEZ", "IN_SURDO_CEGUEIRA"), log=FALSE)
# dados <- check_conditions(dados, "IN_LIBRAS", c("IN_SURDEZ", "IN_SURDO_CEGUEIRA"), log=FALSE)
# dados <- check_conditions(dados, "IN_GUIA_INTERPRETE", c("IN_SURDO_CEGUEIRA"), log=FALSE)

dados <- age_correction(dados, TRUE)

options(scipen=10)
write.table(dados, "./processed/processed.csv", append = FALSE, sep = ",", row.names = FALSE)
options(scipen=0)
