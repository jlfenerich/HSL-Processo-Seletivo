-- Usando PIVOT para transformar os dados mensais em linhas e converter meses em datas (TempObjetivos)
WITH DataNormalizada AS (
    SELECT
        EAN,
        EQUIPE,
        VENDEDOR,
        Mes,
        Quantidade,
        -- Convertendo os nomes dos meses em datas
        CASE Mes
            WHEN 'JAN' THEN CONVERT(DATE, '2023-01-01')
            WHEN 'FEV' THEN CONVERT(DATE, '2023-02-01')
            WHEN 'MAR' THEN CONVERT(DATE, '2023-03-01')
            WHEN 'ABR' THEN CONVERT(DATE, '2023-04-01')
            WHEN 'MAI' THEN CONVERT(DATE, '2023-05-01')
            WHEN 'JUN' THEN CONVERT(DATE, '2023-06-01')
            WHEN 'JUL' THEN CONVERT(DATE, '2023-07-01')
            WHEN 'AGO' THEN CONVERT(DATE, '2023-08-01')
            WHEN 'SET9' THEN CONVERT(DATE, '2023-09-01')
            WHEN 'OUT10' THEN CONVERT(DATE, '2023-10-01')
            WHEN 'NOV' THEN CONVERT(DATE, '2023-11-01')
            WHEN 'DEZ' THEN CONVERT(DATE, '2023-12-01')
        END AS DataPeriodo
    FROM
        (SELECT EAN, EQUIPE, VENDEDOR, JAN, FEV, MAR, ABR, MAI, JUN, JUL, AGO, SET9, OUT10, NOV, DEZ
         FROM TempObjetivos) AS SourceTable
    UNPIVOT
        (Quantidade FOR Mes IN (JAN, FEV, MAR, ABR, MAI, JUN, JUL, AGO, SET9, OUT10, NOV, DEZ)) AS UnpivotTable
)
SELECT 
    EAN,
    EQUIPE,
    VENDEDOR,
    Mes,
    Quantidade,
    DataPeriodo
FROM 
    DataNormalizada;

-- Usando PIVOT para transformar os dados mensais em linhas e converter meses em datas (TempVendas)
WITH DataNormalizada AS (
    SELECT
        EAN,
        EQUIPE,
        VENDEDOR,
        Mes,
        Quantidade,
        -- Convertendo os nomes dos meses em datas
        CASE Mes
            WHEN 'JAN' THEN CONVERT(DATE, '2023-01-01')
            WHEN 'FEV' THEN CONVERT(DATE, '2023-02-01')
            WHEN 'MAR' THEN CONVERT(DATE, '2023-03-01')
            WHEN 'ABR' THEN CONVERT(DATE, '2023-04-01')
            WHEN 'MAI' THEN CONVERT(DATE, '2023-05-01')
            WHEN 'JUN' THEN CONVERT(DATE, '2023-06-01')
            WHEN 'JUL' THEN CONVERT(DATE, '2023-07-01')
            WHEN 'AGO' THEN CONVERT(DATE, '2023-08-01')
            WHEN 'SET9' THEN CONVERT(DATE, '2023-09-01')
            WHEN 'OUT10' THEN CONVERT(DATE, '2023-10-01')
            WHEN 'NOV' THEN CONVERT(DATE, '2023-11-01')
            WHEN 'DEZ' THEN CONVERT(DATE, '2023-12-01')
        END AS DataPeriodo
    FROM
        (SELECT EAN, EQUIPE, VENDEDOR, JAN, FEV, MAR, ABR, MAI, JUN, JUL, AGO, SET9, OUT10, NOV, DEZ
         FROM TempVendas) AS SourceTable
    UNPIVOT
        (Quantidade FOR Mes IN (JAN, FEV, MAR, ABR, MAI, JUN, JUL, AGO, SET9, OUT10, NOV, DEZ)) AS UnpivotTable
)
SELECT 
    EAN,
    EQUIPE,
    VENDEDOR,
    Mes,
    Quantidade,
    DataPeriodo
FROM 
    DataNormalizada;