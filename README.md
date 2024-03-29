# Análises Estratégicas em SQL: Importação, Normalização e Análise Avançada

![MicrosoftSQLServer](https://img.shields.io/badge/Microsoft%20SQL%20Server-CC2927.svg?style=for-the-badge&logo=Microsoft-SQL-Server&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-007ACC.svg?style=for-the-badge&logo=Visual-Studio-Code&logoColor=white)
![DBeaver](https://img.shields.io/badge/DBeaver-382923.svg?style=for-the-badge&logo=DBeaver&logoColor=white)

## Estrutura do Repositório

```nohighlight
├── REDME.md          			                    <- Documentação do projeto.
├── data
│   ├── BASE_OBJETIVOS.csv                          <- Dados brutos a serem normalizados.
│   └── BASE_VENDAS.csv                             <- Dados brutos a serem normalizados. 
│
├── docs             		                        <- Diagrama em .png
│
│
├── sql_scripts 
│   ├── normalization
│   	├── LOAD_OBJETIVO.sql                       <- Script de carregamento dos dados normalizados para tabela OBJETIVO.
│   	├── LOAD_VENDA.sql                          <- Script de carregamento dos dados normalizados para tabela VENDA.
│  		├── Normalizacao_CreateTempTABLES.sql       <- Script para criação de tabela temporaria.
│   	├── Normalizacao_InsertCSVtoTempTABLE.sql   <- Script para criação de tabela temporaria.
│   	├── Normalizacao_TempObjetivos-CD.sql       <- Script para normalização com códigos relacionados.
│   	└── Normalizacao_TempVendas-CD.sql          <- Script para normalização com códigos relacionados.
│   ├── queries
│	   └── 3_Perguntas.sql                          <- Perguntas a serem respondidas através dos dados.
│   └── setup
│   	├── 0_CreateDatabase.sql                    <- Script para criação do banco de dados.
│   	├── 1_CreateTable.sql                       <- Script para criação das tabelas relacionais.
│   	└── 2_Insert.sql                            <- Inserção de dados.      
│
```
## Contexto do Projeto

Este repositório foi criado com o objetivo duplo de compartilhar as soluções desenvolvidas para os desafios propostos no processo seletivo da posição de Analista de Incentivos Pleno na HSL Tecnologia, bem como documentar o processo técnico de preparação dos dados.

## Instalação e Configuração de SQL Server local

O primeiro passo foi instalar e configurar o SQL Server na minha máquina e conectar ao DBeaver para manusear os dados.

## Importação de CSV para SQL Server

O segundo passo deste projeto envolve a importação criteriosa de dados de arquivos CSV para tabelas temporárias no SQL Server.

## Normalização e Estruturação de Dados

Segue-se a etapa de normalização, onde os dados importados são reestruturados e otimizados. 

Os scripts dessa etapa estão disponíveis na pasta `sql_script\normalization`.

## Files Stucture
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

## Diagrama Relaciona da banco de dados
![Diagrama](https://github.com/jlfenerich/HSL-Processo-Seletivo/blob/main/docs/master%20-%20HSL_TESTE%20-%20dbo.png?raw=true)

---

## Objetivos do Projeto

1. **Análise de Equipes e Produtos**: 
   - **Objetivo**: Retornar as informações de "Nome da empresa", "Nome da equipe", "Nome do usuário" e "Quantidade de Produtos" associados ao usuário em sua respectiva equipe.
   - **Filtro**: Produtos com peso maior que 10%.
   - **Ordenação**: Por "Equipe" e "Usuário".

2. **Produtos Mais Vendidos por Equipe**:
   - **Objetivo**: Retornar "Nome da equipe", "Nome do produto" e a "Quantidade de Produtos vendidos".
   - **Especificação**: Apenas para os produtos mais vendidos em cada equipe.

3. **Vendas e Ranking no Primeiro Semestre**:
   - **Objetivo**: Retornar "Nome da equipe", "Nome do produto", "Nome do usuário", "Quantidade de Produtos vendidos" e o "Ranking".
   - **Período**: Apenas no 1º semestre (Janeiro a Junho).

4. **Objetivos por Trimestre**:
   - **Objetivo**: Retornar "Nome da equipe", "Nome do usuário", "Nome do produto", "Nome do Trimestre" (ex.: "1º Trimestre") e a "média dos objetivos por trimestre".
   - **Ordenação**: Por "Nome da equipe", "Nome do usuário", "Nome do produto" e "média dos objetivos por trimestre" (decrescente).

5. **Cobertura de Vendas Mensal**:
   - **Objetivo**: Retornar "Mês", "Nome da equipe", "Nome do usuário", "Nome do produto", "Objetivo", "Venda" e a "Cobertura de atingimento da venda (venda/objetivo)".
   - **Especificação**: Somente os menores atingimentos de cobertura para cada mês.

6. **Desempenho de Vendas de Bactrim em Maio**:
   - **Objetivo**: Retornar "Nome do usuário", "Unidades de Produtos vendidos", "Objetivo", e o percentual do atingimento do objetivo no mês de Maio, para o produto Bactrim.
   - **Ordenação**: Pela performance em ordem decrescente.

7. **Vendas de Yasmin e Representatividade**:
   - **Objetivo**: Retornar "Nome do produto", a quantidade vendida de cada um e sua representatividade no total de vendas da usuária "Yasmin".
   - **Ordenação**: Pela representatividade decrescente.

8. **Crescimento Trimestral de Vendas**:
   - **Objetivo**: Retornar "Nome do usuário", "Nome do produto", a quantidade vendida no segundo trimestre, a quantidade vendida no terceiro trimestre e o crescimento percentual do segundo para o terceiro trimestre.
   - **Especificação**: Apenas para os maiores e menores crescimentos.

9. **Performance/Cobertura Mensal de Vendas**:
   - **Objetivo**: Retornar uma lista de performance/cobertura (Venda / Objetivo) de "Nome do usuário", "Nome do produto" para todos os meses e "Ano".
   - **Detalhes**: Cobertura de cada mês em colunas separadas e com duas casas decimais.
   - **Filtro**: Apenas para o time de Vendas.

10. **Melhor Vendedor de Paracetamol no Último Trimestre**:
    - **Objetivo**: Identificar o "Nome do usuário" que foi o melhor vendedor de Paracetamol no último trimestre do ano.
    - **Empresa**: Considerando todos os times da empresa ALPHALAB.

11. **Pior Vendedor de Nimesulida no Primeiro Trimestre**:
    - **Objetivo**: Identificar o "Nome do usuário" que foi o pior vendedor de Nimesulida no primeiro trimestre do ano.
    - **Empresa**: Considerando todos os times da empresa Labmais.

12. **Melhor Vendedor de Meloxicam do Ano**:
    - **Objetivo**: Identificar o "Nome do usuário" que foi o melhor (cobertura) vendedor de Meloxicam neste ano.
    - **Empresa**: Considerando todos os times da empresa ALPHALAB.


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
- [x] Consultas do script 3_Perguntas.sql  [completion:: 2024-01-30]
- [x] Revisão das respostas/scripts  [completion:: 2024-01-31]
- [x] Documentação  [completion:: 2024-01-30]
	- [x] Documentação da instalação do SQL Server  [completion:: 2024-01-31]
- [x] Revisão da Documentação  [completion:: 2024-01-31]
- [x] Revisar Estrutura do Repositório  [completion:: 2024-01-31]
- [x] Enviar para recrutador  [completion:: 2024-01-31]
</details>
