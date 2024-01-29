-- Inserir dados na tabela temporária para Normalização dos dados.

USE HSL_TESTE;
BULK INSERT TempObjetivos
FROM 'C:\\Users\\jlfen\\OneDrive\\Documentos\\JoaoKasten\\005_applied_projects\\Trabalho\\Processos-Seletivos\\HSL_Teste\\HSL-Processo-Seletivo\\data\\BASE _OBJETIVOS.csv'
WITH
(
    FIELDTERMINATOR = ';',  
    ROWTERMINATOR = '\n',   
    FIRSTROW = 2,
    CODEPAGE = '65001'      -- Para UTF-8
);


-- TRUNCATE TABLE TempObjetivos;
