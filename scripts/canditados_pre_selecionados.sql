WITH competencias_atendidas AS (
    SELECT 
        vc.id_vaga,
        e.id_candidato,
        COUNT(*) AS total_competencias_atendidas
    FROM vagacompetencia vc
    LEFT JOIN competencia_experiencia ce ON vc.id_competencia = ce.id_competencia
    LEFT JOIN experiencias e ON ce.id_experiencia = e.id
    WHERE ce.tempo_competencia_meses >= vc.tempo_de_experiencia_meses
    GROUP BY vc.id_vaga, e.id_candidato
), 

candidatos_validos AS (
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
        COALESCE(ca.total_competencias_atendidas, 0) AS soma_competencias_atendidas
    FROM candidatos c
    JOIN candidato_vaga cv ON c.id = cv.id_candidato
    JOIN vagas v ON cv.id_vaga = v.id
    LEFT JOIN competencias_atendidas ca ON ca.id_vaga = v.id AND ca.id_candidato = c.id
)

SELECT 
    candidato_id, 
    candidato_nome, 
    vaga_id, 
    vaga_titulo,
    atende_localizacao, 
    atende_salario, 
    atende_fit_cultural, 
    soma_competencias_atendidas,
    CASE 
        WHEN (atende_localizacao + atende_salario + atende_fit_cultural + soma_competencias_atendidas) = 0 THEN 'Inconsistência'
        ELSE 'Aprovado'
    END AS status
FROM candidatos_validos;
