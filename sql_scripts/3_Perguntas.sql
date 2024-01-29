USE HSL_TESTE
GO

-- 1) Retornar as informações de "Nome da empresa", "Nome da equipe", "Nome do usuário" e "Qtd de Produtos" associados ao usuário em sua respectiva equipe, 
-- filtrando apenas os produtos com peso maior que 10% e ordenando as informações por "Equipe" e "Usuário".
USE HSL_TESTE
SELECT 
    E.NM_EMPRESA AS 'Nome da Empresa',
    T.NM_EQUIPE AS 'Nome da Equipe',
    U.NM_USUARIO AS 'Nome do Usuário',
    COUNT(P.CD_PRODUTO) AS 'Qtd de Produtos'
FROM 
    USUARIO U
    JOIN EQUIPE_USUARIO EU ON U.CD_USUARIO = EU.CD_USUARIO
    JOIN EQUIPE T ON EU.CD_EQUIPE = T.CD_EQUIPE
    JOIN EMPRESA E ON T.CD_EMPRESA = E.CD_EMPRESA
    JOIN EQUIPE_PRODUTO EP ON T.CD_EQUIPE = EP.CD_EQUIPE
    JOIN PRODUTO P ON EP.CD_PRODUTO = P.CD_PRODUTO
WHERE 
    EP.NR_PESO > 0.10  -- peso maior que 10%
GROUP BY 
    E.NM_EMPRESA, T.NM_EQUIPE, U.NM_USUARIO
ORDER BY 
    T.NM_EQUIPE, U.NM_USUARIO;

-- 2) Retornar o "Nome da equipe" e "Nome do produto" e a "Qtd de Produtos vendidos", porém apenas dos produtos mais vendidos em cada uma das equipes
USE HSL_TESTE;

WITH VendasPorProduto AS (
    SELECT 
        EP.CD_EQUIPE,
        EP.CD_PRODUTO,
        COUNT(*) AS QtdVendida
    FROM 
        VENDA V
        JOIN EQUIPE_PRODUTO EP ON V.CD_PRODUTO = EP.CD_PRODUTO
    GROUP BY 
        EP.CD_EQUIPE, EP.CD_PRODUTO
), MaxVendasPorEquipe AS (
    SELECT 
        CD_EQUIPE,
        MAX(QtdVendida) AS MaxVendas
    FROM 
        VendasPorProduto
    GROUP BY 
        CD_EQUIPE
)
SELECT 
    E.Nm_EQUIPE AS 'Nome da Equipe',
    P.Nm_PRODUTO AS 'Nome do Produto',
    VP.QtdVendida AS 'Qtd de Produtos Vendidos'
FROM 
    MaxVendasPorEquipe MV
    JOIN VendasPorProduto VP ON MV.CD_EQUIPE = VP.CD_EQUIPE AND MV.MaxVendas = VP.QtdVendida
    JOIN EQUIPE E ON VP.CD_EQUIPE = E.CD_EQUIPE
    JOIN PRODUTO P ON VP.CD_PRODUTO = P.CD_PRODUTO;
-- 3) Retornar o "Nome da equipe", "Nome do produto", "Nome do usuário", "Qtd de Produtos vendidos" e o "Ranking" considerando quantidade de produtos vendidos apenas 
-- no 1º semestre (Janeiro a Junho)

-- 4) Retornar "Nome da equipe", "Nome do usuário", "Nome do produto", "Nome do Trimestre" (por exemplo "1º Trimestre") e a "média dos objetivos por trimestre" 
-- ao retornar as informações ordenar por "Nome da equipe", "Nome do usuário", "Nome do produto" e "média dos objetivos por trimestre" (decrescente)

-- 5) Como foi possível verificar até aqui, temos informações de Objetivo e Vendas para cada Equipe, Usuário e Produto e agora precisamos retornar as informações abaixo:
-- "Mês", "Nome da equipe", "Nome do usuário", "Nome do produto", "Objetivo", "Venda" e a "Cobertura de atingimento da venda (que é a venda/objetivo)", porém gostaríamos de 
-- retornar somente os menores atingimentos de cobertura para cada um dos meses do ano.

-- 6) Retornar a lista "Nome do usuário", "Unidades de Produtos vendidos", "Objetivo", e o percentual do atingimento do objetivo no mês de Maio, para o produto 
-- Bactrim e ordenado pela performance em ordem decrescente

-- 7) Retornar a relação dos produtos, a quantidade vendida de cada um deles e sua representatividade dentro do total de vendas para a 
-- usuária "Yasmin", ordenada pela representatividade decrescente

-- 8) Retornar "Nome do usuário", "Nome do produto", a quantidade vendida no segundo trimestre, a quantidade vendida no terceiro trimestre e o crescimento do segundo para o 
-- terceiro trimestre em percentual, apenas daqueles com o Maior e o Menor crescimento

-- 9) Retornar uma lista de performance/cobertura (onde performance = Venda / Objetivo) de "Nome do usuário", 
-- "Nome do produto" de todos os meses disponíveis e "Ano", onde a cobertura de cada mês, deve estar por cada coluna.
-- Exibir a "Cobertura", com duas casas decimais
-- Filtrar somente o time de Vendas
-- Ex.:
/*
NR_ANO NM_USUARIO NM_PRODUTO JANEIRO FEVEREIRO MARÇO ABRIL MAIO JUNHO JULHO AGOSTO SETEMBRO OUTUBRO NOVEMBRO DEZEMBRO
2023 André abcalcium-b12 110,71 111,29 119,79 92,63 87,05 98,03 108,62 104,15 101,98 104,76 88,85 94,16
2023 André abcler-abnat 96,89 94,44 120 118,73 87,68 95,7 118,99 94,21 99,13 96,12 135,85 118,13
2023 André Azitromicina 109,8 130,77 91,42 135,21 122,16 128,03 82,64 94,18 93,88 100 109,38 83,73
*/

-- 10) Quem foi o melhor (em quantidade vendida) vendedor de Paracetamol no último trimestre do ano, considerando
-- todos os times da empresa ALPHALAB?

-- 11) Quem foi o pior vendedor (em quantidade vendida) de Nimesulida no primeiro trimestre do ano, considerando
-- todos os times da empresa Labmais?

-- 12) Quem foi o melhor (cobertura) vendedor de Meloxicam neste ano, considerando
-- todos os times da empresa ALPHALAB?


