
## O script

Os scripts devem ser executados a partir do script principal: preprocess.R

Nele todos os outros scripts são carregados para uso das funções neles declarados. As função usadas são as seguintes:

	remove_outliers
	conditions_satisfied
	numeric_columns
	eraseColumns
	age

### remove_outliers()
Outliers são detectados usando ferramentas do próprio R e então removidos.
####A chamada:
	dados <- remove_outliers(dados,target,log)

####Os parâmetros
	dados: os dados a serem tratados em sua forma atual
	target: o atributo(coluna) a ser tratado
	log: booleano que define se a função irá ou não gerar debug

### conditions_satisfied()
Os valores de alguns atributos devem ser conditionados por outros
e.g se um indivíduo pede ajuda especial mas não declara uma deficiência, isso é considerado um erro que deve ser corrigido.
####A chamada: 
	dados <- conditions_satisfied(dados, conditioned, conditions, log=FALSE)

####Os parâmetros
	dados: os dados a serem tratados em sua forma atual
	conditioned: o atributo(coluna) que dependedente de outros
	conditions: Atributos os quais "conditioned" é dependente
	log: booleano que define se a função irá ou não gerar debug
