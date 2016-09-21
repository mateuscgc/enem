
## O script

Os scripts devem ser executados a partir do script principal: preprocess.R

Nele todos os outros scripts são carregados para uso das funções neles declarados. As função usadas são as seguintes:

	remove_outliers
	check_conditions
	numeric_column
	eraseColumns
	age_corretion

### remove_outliers()
Outliers são detectados usando ferramentas do próprio R e então removidos.
####A chamada:
	dados <- remove_outliers(dados,target,log)

####Os parâmetros
	dados: os dados a serem tratados em sua forma atual
	target: o atributo(coluna) a ser tratado
	log: booleano que define se a função irá ou não gerar debug

### check_conditions()
Os valores de alguns atributos devem ser conditionados por outros
e.g se um indivíduo pede ajuda especial mas não declara uma deficiência, isso é considerado um erro que deve ser corrigido.
####A chamada: 
	dados <- check_conditions(dados, conditioned, conditions, log=FALSE)

####Os parâmetros
	dados: os dados a serem tratados em sua forma atual
	conditioned: o atributo(coluna) que dependedente de outros
	conditions: Atributos os quais "conditioned" é dependente
	log: booleano que define se a função irá ou não gerar debug

### numeric_colummn()
Coverte as colunas da base que precisem ser numéricas, em dados de fato numéricos
####A chamada:
	dados <- numeric_column(dados, target, default, log)

####Os parâmetros
	dados: os dados a serem tratados em sua forma atual
	target: o atributo(coluna) a ser tratado
	default: determina qual valor será colocado em caso de um valor estiver faltando nos dados da base
	log: booleano que define se a função irá ou não gerar debug

### eraseColumns()
Remoção de colunas consideradas desnecessárias
####A chamada:
	dados <- eraseColumns(dados,unnecessary,1)

####Os parâmetros
	dados: os dados a serem tratados em sua forma atual
	unnecessary: vetor com os atributos(colunas) a serem removidos
	1: um valor necessário para que a recursão use todo o vetor de atributos

### age_corretion()
Normaliza as idades
⋅⋅⋅Assumimos que certas idades poderiam caracterizar erros, como pessoas com 115 anos de idade ou com 7 anos de idade. 
⋅⋅⋅Outro exemplo são pessoas concluindo o Ensino Médio com 3 anos.

⋅⋅⋅Assim sendo, assumiu-se que qualquer indivíduo fora do padrão (menos de 10 anos de idade, mais de 100) deveria ser normalizado da seguinte forma:
⋅⋅⋅Assumimos que o inidivíduo concluiu o ensino médio com 17 anos e portanto somamos a quanto tempo ele concluiu o ensino médio (17 + (2012("AnoDaProva") - AnoDeConclusão) ).
####A chamada:
	dados <- age_corretion(dados,log)

####Os parâmetros
	dados: os dados a serem tratados em sua forma atual
	log: booleano que define se a função irá ou não gerar debug