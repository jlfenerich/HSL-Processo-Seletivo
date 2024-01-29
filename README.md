# PSEUDO CÓDIGO:
- [x] Configurar um servidor local SQL Server  [completion:: 2024-01-28]
- [x] Com os scripts fornecidos:  [completion:: 2024-01-28]
	- [x] Criar DataBase (0_CreateDatabase.sql)  [completion:: 2024-01-28]
	- [x] Criar Tabelas (1_CreateTable.sql)  [completion:: 2024-01-28]
	- [x] Inserir Parâmetros (Insert.sql) nas Tabelas  [completion:: 2024-01-28]
- [ ] Carregar .csv nas Tabelas
	- [ ] normalizar dos dados
		- [ ] 
## SCRIPTS: 
* 0_CreateDatabase.sql
* 1_CreateTable.sql
* 2_Insert.sql
* 3_Perguntas.sql
## ARQUIVOS
* BASE_OBJETIVOS.csv
	* `EAN`
	* `EQUIPE`
	* `VENDEDOR`
	* `JAN`
	* `FEV`
	* `MAR`
	* `ABR`
	* `MAI`
	* `JUN`
	* `JUL`
	* `AGO`
	* `SET`
	* `OUT`
	* `NOV`
	* `DEZ`
* BASE_VENDAS.csv
	* `EAN`
	* `EQUIPE`
	* `VENDEDOR`
	* `JAN`
	* `FEV`
	* `MAR`
	* `ABR`
	* `MAI`
	* `JUN`
	* `JUL`
	* `AGO`
	* `SET`
	* `OUT`
	* `NOV`
	* `DEZ`
## DATABASE
* `OBJETIVO`
	* `CD_VENDA` PRIMARY KEY
	* `CD_PRODUTO` 
	* `CD_EQUIPE`
	* `CD_USUARIO`
	* `DT_PERIODO`
	* `NR_QUANTIDADE`
* `VENDA`
	* `CD_VENDA` PRIMARY KEY
	* `CD_PRODUTO`
	* `CD_EQUIPE`
	* `CD_USUARIO`
	* `DT_PERIODO`
	* `NR_QUANTIDADE`
* `PRODUTO`
	* `CD_PRODUTO` PRIMARY KEY
	* `NM_PRODUTO`
	* `EAN`
* `EQUIPE`
	* `CD_EQUIPE` PRIMARY KEY
	* `NM_EQUIPE`
	* `CD_EMPRESA`
* `EMPRESA`
	* `CD_EMPRESA` PRIMARY KEY
	* `NN_EMPRESA`
* `USARIO`
	* `CD_USUARIO` PRIMARY KEY
	* `NM_USUARIO`
* `EQUIPE_PRODUTO`
	* `CD_EQUIPE_PRODUTO` PRIMARY KEY
	* `CD_EQUIPE`
	* `CD_PRODUTO`
	* `NR_PESO`
* `EMPRESA_PRODUTO`
	* `CD_EMPRESA_PRODUTO` PRIMARY KEY
	* `CD_EMPRESA`
	* `CD_PRODUTO`
* `EQUIPE_USUARIO`
	* `CD_EQUIPE_USUARIO` PRIMARY KEY
	* `CD_EQUIPE`
	* `CD_USUARIO`
* `USUARIO_EMPRESA`
	* `CD_EMPRESA_USUARIO` 
	* `CD_EMPRESA`
	* `CD_USUARIO`
## DIAGRAMA
![[Diagrama.png]]
## 3_Perguntas.sql


1) Retornar as informações de "Nome da empresa", "Nome da equipe", "Nome do usuário" e "Qtd de Produtos" associados ao usuário em sua respectiva equipe, filtrando apenas os produtos com peso maior que 10% e ordenando as informações por "Equipe" e "Usuário".

2) Retornar o "Nome da equipe" e "Nome do produto" e a "Qtd de Produtos vendidos", porém apenas dos produtos mais vendidos em cada uma das equipes 

3) Retornar o "Nome da equipe", "Nome do produto", "Nome do usuário", "Qtd de Produtos vendidos" e o "Ranking" considerando quantidade de produtos vendidos apenas no 1º semestre (Janeiro a Junho).

4) Retornar "Nome da equipe", "Nome do usuário", "Nome do produto", "Nome do Trimestre" (por exemplo "1º Trimestre") e a "média dos objetivos por trimestre". Ao retornar as informações, ordenar por "Nome da equipe", "Nome do usuário", "Nome do produto" e "média dos objetivos por trimestre" (decrescente).

5) Retornar "Mês", "Nome da equipe", "Nome do usuário", "Nome do produto", "Objetivo", "Venda" e a "Cobertura de atingimento da venda (que é a venda/objetivo)". Retornar somente os menores atingimentos de cobertura para cada um dos meses do ano.

6) Retornar "Nome do usuário", "Unidades de Produtos vendidos", "Objetivo", e o percentual do atingimento do objetivo no mês de Maio, para o produto Bactrim. Ordenar pela performance em ordem decrescente.

7) Retornar "Nome do produto", a quantidade vendida de cada um deles e sua representatividade dentro do total de vendas para a usuária "Yasmin". Ordenar pela representatividade decrescente.

8) Retornar "Nome do usuário", "Nome do produto", a quantidade vendida no segundo trimestre, a quantidade vendida no terceiro trimestre e o crescimento do segundo para o terceiro trimestre em percentual. Retornar apenas daqueles com o Maior e o Menor crescimento.

9) Retornar uma lista de performance/cobertura (onde performance = Venda / Objetivo) de "Nome do usuário", "Nome do produto" de todos os meses disponíveis e "Ano". A cobertura de cada mês deve estar por cada coluna. Exibir a "Cobertura", com duas casas decimais. Filtrar somente o time de Vendas.

10) Retornar o "Nome do usuário" que foi o melhor (em quantidade vendida) vendedor de Paracetamol no último trimestre do ano, considerando todos os times da empresa ALPHALAB.

11) Retornar o "Nome do usuário" que foi o pior vendedor (em quantidade vendida) de Nimesulida no primeiro trimestre do ano, considerando todos os times da empresa Labmais.

12) Retornar o "Nome do usuário" que foi o melhor (cobertura) vendedor de Meloxicam neste ano, considerando todos os times da empresa ALPHALAB.

