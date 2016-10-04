dados <- read.table("./processed/processed.csv", sep=",", header=TRUE)

#Cria uma nova coluna para distribuir o conjunto de treinamento e teste, com uma proporção (2 : 1)
dados[, "train"] <- ifelse(runif(nrow(dados))<2/3, 1,0)

# Recupera o número da coluna criada para remover
trainColNum <- grep("train", names(dados))

trainSubset <- dados[dados$train==1, -trainColNum]
testSubset <- dados[dados$train==0, -trainColNum]

options(scipen=10)
write.table(trainSubset, "./train_subset.csv", append = FALSE, sep = ",", row.names = FALSE)
write.table(testSubset, "./test_subset.csv", append = FALSE, sep = ",", row.names = FALSE)
options(scipen=0)
