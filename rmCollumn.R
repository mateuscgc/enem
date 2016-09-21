#
#dados <- read.table("./data/ENEM_LEVE.csv", sep=",", header=TRUE)

# unnecessary = c("TP_COR_RACA","TP_ESTADO_CIVIL",
#                 "COD_MUNICIPIO_INSC","NO_ENTIDADE_CERTIFICACAO","PK_COD_ENTIDADE")
eraseColumns <- function(dados,labels,i) {
  if (is.na(labels[i]))    return (dados)
  else
    dados <- dados[,-(which(colnames(dados) == labels[i]))]
    print(labels[i])
    return (eraseColumns(dados,labels,i+1))

}
# example: LabesToIndex(unnecessar,c(1),1)
#dados <- eraseColumns(dados,unnecessary,1)
#dados <- dados[,-(which(colnames(dados) == "TP_COR_RACA"))]
