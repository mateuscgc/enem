# Biblioteca com implementação do Naive Bayes
library(e1071)

same_class <- function(a, b) {
  return ((a == 'P' && b == 'P') || (a != 'P' && b != 'P'))
}

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

  cols <- c()
  rows <- c()
  corrc <- c()

  for(r in 1:length(pred)) {
    if(pred[r] != test_set[r, "IN_STATUS_REDACAO"])
      erros[i] = erros[i] + 1

    # numeric_column(pred)

    if(test_set[r, "IN_STATUS_REDACAO"] == 'P')
      cols[r] = 'Ñ deu merda'
    else
      cols[r] = 'Deu merda'

    if(same_class(pred[r], test_set[r, "IN_STATUS_REDACAO"])) {
      if(pred[r] == test_set[r, "IN_STATUS_REDACAO"]) {
        rows[r] = 'classificou corretamente'
        corrc[r] = 'Predição correta'
      } else {
        rows[r] = 'classificou corretamente a classe'
        corrc[r] = 'Predição incorreta'
      }
    } else {
      rows[r] = 'classificou incorretamente'
      corrc[r] = 'Predição incorreta'
    }
  }
  # corrc <- merge(corrc, test_set[, "IN_STATUS_REDACAO"])
  stacks <- table(corrc, test_set[, "IN_STATUS_REDACAO"])

  # ColNums <- grep("P", names(stacks))

  print(stacks)
  barplot(stacks, main="Distribuição de predições por status e validade",
          xlab="Status da redação", col=c("white","grey"),
          legend = rownames(stacks))

  print(length(cols))
  print(length(rows))
  print(table(rows, cols))

  print(table(pred, test_set[, "IN_STATUS_REDACAO"]))
  # erros[i] = mean(pred, test_set[, "IN_STATUS_REDACAO"])
  erros[i] = erros[i] / length(pred)
}

print(erros)
print(mean(erros))
