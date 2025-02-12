WITH candidatos_validos AS (
    SELECT 
        c.id AS candidato_id,
        c.nome AS candidato_nome,
        v.id AS vaga_id,
        v.nome AS vaga_titulo,
        CASE 
            WHEN c.endereco LIKE '%SP' OR c.endereco LIKE '%SC' OR c.endereco LIKE '%PE' THEN 1 ELSE 0 
        END AS atende_localizacao,
        CASE 
            WHEN cv.pretensao_salarial BETWEEN v.salario_minimo AND v.salario_maximo THEN 1 ELSE 0 
        END AS atende_salario,
        CASE 
            WHEN cv.recomendacao = 1 THEN 1 ELSE 0 
        END AS atende_fit_cultural,
        CASE 
            WHEN (SELECT SUM(ce.tempo_competencia) FROM competencia_experiencia ce 
                  JOIN experiencias e ON ce.id_experiencia = e.id
                  WHERE e.id_candidato = c.id) >= 60 THEN 1 ELSE 0 
        END AS atende_experiencia_tecnica
    FROM candidatos c
    JOIN candidato_vaga cv ON c.id = cv.id_candidato
    JOIN vagas v ON cv.id_vaga = v.id
)
SELECT 
    candidato_id, 
    candidato_nome, 
    vaga_id, 
    vaga_titulo,
    atende_localizacao, 
    atende_salario, 
    atende_fit_cultural, 
    atende_experiencia_tecnica,
    CASE 
        WHEN (atende_localizacao + atende_salario + atende_fit_cultural + atende_experiencia_tecnica) = 0 THEN 'Inconsistência'
        ELSE 'Aprovado'
    END AS status
FROM candidatos_validos;
