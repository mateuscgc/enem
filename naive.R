# Biblioteca com implementação do Naive Bayes
library(e1071)

# leitura de conjuntos de teste e de treinamento já definidos
trainSubset <- read.table("./train_subset.csv", sep=",", header=TRUE)
testSubset <- read.table("./test_subset.csv", sep=",", header=TRUE)

# # Divisão de conjuntos
# dados <- read.table("./preprocessed", sep=",", header=TRUE)
#
# #Cria uma nova coluna para distribuir o conjunto de treinamento e teste, com uma proporção (2 : 1)
# dados[, "train"] <- ifelse(runif(nrow(dados))<2/3, 1,0)
#
# # Recupera o número da coluna criada para remover
# trainColNum <- grep("train", names(dados))
#
# trainSubset <- dados[dados$train==1, -trainColNum]
# testSubset <- dados[dados$train==0, -trainColNum]

# Execução do Naive Bayes
model <- naiveBayes(IN_STATUS_REDACAO ~ ., data = trainSubset)
pred <- predict(model, testSubset)

# Tabela para comparação entre predição (linha) e realidade (coluna)
table(pred, testSubset[, "IN_STATUS_REDACAO"])
