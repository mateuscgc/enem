# Biblioteca com implementação do Naive Bayes
library(e1071)

dados <- read.table("./processed/processed.csv", sep=",", header=TRUE)

folds <- 1:10

dados$fold <- sample(folds, nrow(dados), replace = TRUE)

foldColNum <- grep("fold", names(dados))

erros <- c()

for(i in folds) {
  test_set <- dados[dados$fold==i, -foldColNum]
  training_set <- dados[dados$fold %in% folds[-i], -foldColNum]

  model <- naiveBayes(IN_STATUS_REDACAO ~ ., data = training_set)
  pred <- predict(model, test_set)

  erros[i] = 0;

  for(r in 1:length(pred)) {
      if(pred[r] != test_set[r, "IN_STATUS_REDACAO"])
        erros[i] = erros[i] + 1
  }

  print(table(pred, test_set[, "IN_STATUS_REDACAO"]))
  # erros[i] = mean(pred, test_set[, "IN_STATUS_REDACAO"])
  erros[i] = erros[i] / length(pred)
}

print(erros)
