dados <- data.frame(read.table("./data/ENEM_LEVE.csv", sep=",", header=TRUE))
dados$IDADE = as.numeric(as.character(dados$IDADE))
dados$ANO_CONCLUIU = as.numeric(as.character(dados$ANO_CONCLUIU))
index =((dados$IDADE > 100) | (dados$IDADE < 10))
#dados = dados[index, ]
dados[index,c("IDADE")] <- 17 + 2012 - dados[index,c("ANO_CONCLUIU")]
boxplot(na.omit(as.numeric(as.character(dados$IDADE))), main="", xlab="", ylab="Nota Matem?tica")
#dados <- ifelse(!is.na(dados$ANO_CONCLUIU), 17 + 2012 - dados$ANO_CONCLUIU , dados$IDADE)
#idade <- dados[!is.na(as.numeric(as.character(dados$IDADE))) & (dados$IDADE < 100) & (dados$IDADE > 10), c("IDADE")]
#dados[(( (as.numeric(as.character(dados$IDADE))) < 100) | ( (as.numeric(as.character(dados$IDADE))) > 10)),dados$IDADE] <- "17"
#idade <- dados[!is.na(as.numeric(as.character(dados$IDADE))) , c("IDADE")]
#idade[((idade$IDADE < 100) | (idade$IDADE > 10)),idade$IDADE] = 17 #<- transform(idade, IDADE=ifelse(((IDADE < 100) | (IDADE > 10)),17, IDADE) )
#idade <- transform(idade, "IDADE"=17 )
#print(idade)
#boxplot(na.omit(as.numeric(as.character(idade))), main="", xlab="", ylab="Nota Matem?tica")
