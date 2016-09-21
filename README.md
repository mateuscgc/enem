
## O script

Os scripts devem ser executados a partir do script principal: preprocess.R

Nele todos os outros scripts são carregados para uso das funções neles declarados. As função usadas são as seguintes:

	remove_outliers
	conditions_satisfied
	numeric_columns
	eraseColumns
	age
### Remove_outliers
A chamada: dados <- remove_outliers(dados,target,log)

Os parâmetros
	dados: os dados a serem tratados em sua forma atual
	target: o atributo(coluna) a ser tratado
	log: booleano que define se a função irá ou não gerar debug

### remove_outliers()
A chamada: dados <- remove_outliers(dados,target,log)

####Os parâmetros
	dados: os dados a serem tratados em sua forma atual
	target: o atributo(coluna) a ser tratado
	log: booleano que define se a função irá ou não gerar debug

### conditions_satisfied()
A chamada: dados <- conditions_satisfied(dados, conditioned, conditions, log=FALSE)

####Os parâmetros
	dados: os dados a serem tratados em sua forma atual
	conditioned: o atributo(coluna) que dependedente de outros
	conditions: booleano que define se a função irá ou não gerar debug

