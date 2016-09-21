#
dados <- read.table("./data/ENEM_LEVE.csv", sep=",", header=TRUE)
LabelsToIndex <- function(x,y,i) {
  if (is.na(x[i]))    return (y)
  else  {
    y[i] = which(colnames(dados) == x[i])
    return (LabelsToIndex(x,y,i+1))
  }
}
# example: LabesToIndex(unnecessar,c(1),1)
unnecessary = c("TP_COR_RACA","TP_ESCOLA","TP_ESTADO_CIVIL")
eraseLabels <- LabelsToIndex(unnecessary,c(1),1)
