-- Adicionar uma nova coluna para armazenar o tempo de experiência em meses
ALTER TABLE vagacompetencia ADD COLUMN tempo_de_experiencia_meses INT;

-- Atualizar a nova coluna com os valores convertidos
UPDATE vagacompetencia
SET tempo_de_experiencia_meses = 
    CASE
        -- Se a string contiver "Anos" ou "anos", multiplicar por 12
        WHEN tempo_de_experiencia LIKE '%Anos%' OR tempo_de_experiencia LIKE '%anos%' THEN
            CAST(REPLACE(REPLACE(tempo_de_experiencia, ' Anos', ''), ' anos', '') AS FLOAT) * 12
        -- Se a string contiver "Meses" ou "meses", usar o valor diretamente
        WHEN tempo_de_experiencia LIKE '%Meses%' OR tempo_de_experiencia LIKE '%meses%' THEN
            CAST(REPLACE(REPLACE(tempo_de_experiencia, ' Meses', ''), ' meses', '') AS FLOAT)
        -- Se a string contiver "ano" ou "mes", tratar casos singulares
        WHEN tempo_de_experiencia LIKE '%ano%' THEN
            CAST(REPLACE(REPLACE(tempo_de_experiencia, ' ano', ''), ' anos', '') AS FLOAT) * 12
        WHEN tempo_de_experiencia LIKE '%mes%' THEN
            CAST(REPLACE(REPLACE(tempo_de_experiencia, ' mes', ''), ' meses', '') AS FLOAT)
        -- Caso padrão (não esperado)
        ELSE 0
    END;


ALTER TABLE competencia_experiencia ADD COLUMN tempo_competencia_meses INTEGER;


UPDATE competencia_experiencia
SET tempo_competencia_meses = CAST(tempo_competencia / 30 AS INTEGER);

