-- Verificar se a coluna 'tempo_de_experiencia_meses' já existe na tabela 'vagacompetencia'
PRAGMA table_info(vagacompetencia);

-- Caso a coluna não exista, executar o ALTER TABLE
-- Isso deve ser feito programaticamente em Python após a verificação da existência da coluna

-- Atualizar a nova coluna com os valores convertidos, se ela foi criada
UPDATE vagacompetencia
SET tempo_de_experiencia_meses = 
    CASE
        WHEN tempo_de_experiencia LIKE '%Anos%' OR tempo_de_experiencia LIKE '%anos%' THEN
            CAST(REPLACE(REPLACE(tempo_de_experiencia, ' Anos', ''), ' anos', '') AS FLOAT) * 12
        WHEN tempo_de_experiencia LIKE '%Meses%' OR tempo_de_experiencia LIKE '%meses%' THEN
            CAST(REPLACE(REPLACE(tempo_de_experiencia, ' Meses', ''), ' meses', '') AS FLOAT)
        WHEN tempo_de_experiencia LIKE '%ano%' THEN
            CAST(REPLACE(REPLACE(tempo_de_experiencia, ' ano', ''), ' anos', '') AS FLOAT) * 12
        WHEN tempo_de_experiencia LIKE '%mes%' THEN
            CAST(REPLACE(REPLACE(tempo_de_experiencia, ' mes', ''), ' meses', '') AS FLOAT)
        ELSE 0
    END;

-- Verificar se a coluna 'tempo_competencia_meses' já existe na tabela 'competencia_experiencia'
PRAGMA table_info(competencia_experiencia);

-- Caso a coluna não exista, executar o ALTER TABLE
-- Isso também deve ser feito programaticamente em Python após a verificação da existência da coluna

-- Atualizar a nova coluna com os valores convertidos, se ela foi criada
UPDATE competencia_experiencia
SET tempo_competencia_meses = CAST(tempo_competencia / 30 AS INTEGER);
