#dados <- data.frame(read.table("./data/ENEM_LEVE.csv", sep=",", header=TRUE))

age <- function(dados){
  #transform the collunms in numerica data
  dados$IDADE = ifelse(is.na(dados$IDADE), 0 ,as.numeric(as.character(dados$IDADE)))
  dados$ANO_CONCLUIU = ifelse(is.na(as.numeric(as.character(dados$ANO_CONCLUIU))), 0 ,as.numeric(as.character(dados$ANO_CONCLUIU)))#print(any(is.na(dados$ANO_CONCLUIU)))

  #store the conditionals
  index =((dados$IDADE > 100) | (dados$IDADE < 10))
  #dados = dados[index, ]

  # Normalize the outliers ages
  # Basically assume that the individual has concluded high school when he was 17 years old
  dados[index,c("IDADE")] <- 17 + 2012 - dados[index,c("ANO_CONCLUIU")]
  # Plot!
  boxplot(na.omit(as.numeric(as.character(dados$IDADE))), main="", xlab="", ylab="Nota Matem?tica")
  return(dados)
}
#temporary
#write.table(dados,"/home/ramon/temp/test.csv",append = FALSE, sep = ",")
