# Preparação de Dados para Processo Seletivo 

## Repo Structure

```nohighlight
├── LICENSE
├── README.md          			<- The top-level README for developers using this project.
├── data
│   ├── BASE_OBJETIVOS.csv      <- Data from third party sources.
│   └── BASE_VENDAS.csv         <- Intermediate data that has been transformed. 
│
├── docs             		    <- A default Sphinx project; see sphinx-doc.org for details
│
├── references                  <- Data dictionaries, manuals, and all other explanatory materials.
│
├── sql_scripts 
│   ├── 0_CreateDatabase.sql    <- Generated analysis as HTML, PDF, LaTeX, etc.
│   ├── 1_CreateTable.sql    
│   ├── 2_Insert.sql    
│   ├── 3_Perguntas.sql
│   ├── InsertCSVtoTempTABLE.sql
│   └── TempObjetivos-CD.sql         <- Generated graphics and figures to be used in reporting
│
├── requirements.txt   <- The requirements file for reproducing the analysis environment, e.g.
│                         generated with `pip freeze > requirements.txt`
│
│
```
## Contexto do Projeto

Este repositório foi criado com o objetivo duplo de compartilhar as soluções desenvolvidas para os desafios propostos em um processo seletivo, bem como documentar o processo técnico de preparação dos dados. Ele serve como uma vitrine tanto das habilidades analíticas quanto das competências técnicas em manipulação de dados.

## Importação de CSV para SQL Server

O primeiro passo deste projeto envolve a importação criteriosa de dados de arquivos CSV para tabelas temporárias no SQL Server. Este processo é fundamental para assegurar que os dados necessários para as análises estejam disponíveis no banco de dados, prontos para serem consultados e manipulados conforme as necessidades das questões do processo seletivo.

## Normalização e Estruturação de Dados

Segue-se a etapa de normalização, onde os dados importados são reestruturados e otimizados. Esta fase é crucial para transformar dados brutos em um conjunto estruturado e coerente, ideal para realizar análises eficientes e precisas. A normalização aborda desde a correção de inconsistências até a melhoria da integridade e performance das consultas SQL.

Este repositório detalha cada passo do processo, desde a importação inicial dos dados até a sua completa normalização, oferecendo insights valiosos sobre práticas efetivas de manipulação de dados em SQL para situações semelhantes.

<details>
  <summary>To do</summary>

- [x] Configurar um servidor local SQL Server  [completion:: 2024-01-28]
- [x] Com os scripts fornecidos:  [completion:: 2024-01-28]
	- [x] Criar DataBase (0_CreateDatabase.sql)  [completion:: 2024-01-28]
	- [x] Criar Tabelas (1_CreateTable.sql)  [completion:: 2024-01-28]
	- [x] Inserir Parâmetros (Insert.sql) nas Tabelas  [completion:: 2024-01-28]
- [x] Carregar .csv nas Tabelas  [completion:: 2024-01-29]
	- [x] normalizar dos dados  [completion:: 2024-01-29]
		- [x] mapear dados para normalizar  [completion:: 2024-01-29]
		- [x] "Pivotar" tabela BASE_Objetivos de Horizontal p/ Vertical  [completion:: 2024-01-29]
		- [x] "Pivotar" tabela BASE_Vendas de Horizontal p/ Vertical  [completion:: 2024-01-29]
		- [x] JOIN para normalização para as chaves  [completion:: 2024-01-29]
	- [x] Carregar Base para OBJETIVO  [completion:: 2024-01-29]
	- [x] Carregar Base para VENDA  [completion:: 2024-01-29]
- [ ] Consultas do script 3_Perguntas.sql
- [ ] Revisão das respostas/scripts
- [ ] Documentação
- [ ] Revisão da Documentação
- [ ] Enviar para recrutador
</details>

# Files Stucture
<details>
  <summary>SCRIPTS</summary>

  * 0_CreateDatabase.sql
  * 1_CreateTable.sql
  * 2_Insert.sql
  * 3_Perguntas.sql
</details>

<details>
  <summary>ARQUIVOS</summary>

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
</details>

<details>
  <summary>DATABASE</summary>

* `OBJETIVO`
	* `CD_VENDA` PRIMARY KEY
	* `CD_PRODUTO` FOREIGN KEY
	* `CD_EQUIPE` FOREIGN KEY
	* `CD_USUARIO` FOREIGN KEY
	* `DT_PERIODO`
	* `NR_QUANTIDADE`
* `VENDA`
	* `CD_VENDA` PRIMARY KEY
	* `CD_PRODUTO` FOREIGN KEY
	* `CD_EQUIPE` FOREIGN KEY
	* `CD_USUARIO` FOREIGN KEY
	* `DT_PERIODO`
	* `NR_QUANTIDADE`
* `PRODUTO`
	* `CD_PRODUTO` PRIMARY KEY
	* `NM_PRODUTO`
	* `EAN`
* `EQUIPE`
	* `CD_EQUIPE` PRIMARY KEY
	* `NM_EQUIPE`
	* `CD_EMPRESA` FOREIGN KEY
* `EMPRESA`
	* `CD_EMPRESA` PRIMARY KEY
	* `NN_EMPRESA`
* `USARIO`
	* `CD_USUARIO` PRIMARY KEY
	* `NM_USUARIO`
* `EQUIPE_PRODUTO`
	* `CD_EQUIPE_PRODUTO` PRIMARY KEY
	* `CD_EQUIPE` FOREIGN KEY
	* `CD_PRODUTO` FOREIGN KEY
	* `NR_PESO`
* `EMPRESA_PRODUTO`
	* `CD_EMPRESA_PRODUTO` PRIMARY KEY
	* `CD_EMPRESA` FOREIGN KEY
	* `CD_PRODUTO` FOREIGN KEY
* `EQUIPE_USUARIO`
	* `CD_EQUIPE_USUARIO` PRIMARY KEY
	* `CD_EQUIPE` FOREIGN KEY
	* `CD_USUARIO` FOREIGN KEY
* `USUARIO_EMPRESA`
	* `CD_EMPRESA_USUARIO` PRIMARY KEY
	* `CD_EMPRESA` FOREIGN KEY
	* `CD_USUARIO` FOREIGN KEY
</details>

## DIAGRAMA RELACIONAL DA BASE DE DADOS
![Diagrama](https://github.com/jlfenerich/HSL-Processo-Seletivo/blob/main/docs/master%20-%20HSL_TESTE%20-%20dbo.png?raw=true)

## Perguntas (3_Perguntas.sql)


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

# references

https://drivendata.github.io/cookiecutter-data-science/
