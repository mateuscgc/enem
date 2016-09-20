dados <- data.frame(read.table("./data/ENEM_LEVE.csv", sep=",", header=TRUE))

#transform the collunms in numerica data
dados$IDADE = as.numeric(as.character(dados$IDADE))
dados$ANO_CONCLUIU = as.numeric(as.character(dados$ANO_CONCLUIU))

#store the conditionals
index =((dados$IDADE > 100) | (dados$IDADE < 10))
#dados = dados[index, ]

# Normalize the outliers age
dados[index,c("IDADE")] <- 17 + 2012 - dados[index,c("ANO_CONCLUIU")]

# Plot!
boxplot(na.omit(as.numeric(as.character(dados$IDADE))), main="", xlab="", ylab="Nota Matem?tica")

