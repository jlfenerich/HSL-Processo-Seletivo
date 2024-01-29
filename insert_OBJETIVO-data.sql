BULK INSERT OBJETIVO
FROM 'C:\Users\jlfen\OneDrive\Documentos\JoaoKasten\005_applied_projects\Trabalho\Processos-Seletivos\HSL_Teste\BASE _OBJETIVOS.csv'
WITH
(
    FIELDTERMINATOR = ';',  -- Ponto e vírgula como separador
    ROWTERMINATOR = '\n',   -- Final de linha
    FIRSTROW = 2            -- Se a primeira linha for cabeçalho
);
