-- Pergunta 01	|	Resposta: foram abertos 73 chamados
SELECT Count(*) AS total_chamados
FROM `datario.administracao_servicos_publicos.chamado_1746` 
WHERE DATE(data_inicio) = '2023-04-01'
  AND data_particao = "2023-04-01";



-- Pergunta 02	|	Resposta: Poluição sonora
SELECT tipo, COUNT(tipo) as Qtd
FROM `datario.administracao_servicos_publicos.chamado_1746` 
WHERE DATE(data_inicio) = '2023-04-01'
  AND data_particao = "2023-04-01"
GROUP BY tipo
ORDER BY 2 DESC
LIMIT 1;



-- Pergunta 03	|	Resposta: Engenho de Dentro=8, Leblon=6, Campo Grande=6
SELECT b.nome as nome_bairro, COUNT(b.nome) as qtd_chamados
FROM `datario.administracao_servicos_publicos.chamado_1746` c
LEFT JOIN `datario.dados_mestres.bairro` b
ON c.id_bairro = b.id_bairro
WHERE DATE(c.data_inicio) = '2023-04-01'
  AND c.data_particao = "2023-04-01"
GROUP BY b.nome
ORDER BY 2 DESC
LIMIT 3;



-- Pergunta 04	|	Resposta: Zona Norte=25
SELECT b.subprefeitura, COUNT(b.subprefeitura) as qtd_chamados
FROM `datario.administracao_servicos_publicos.chamado_1746` c
LEFT JOIN `datario.dados_mestres.bairro` b
ON c.id_bairro = b.id_bairro
WHERE DATE(c.data_inicio) = '2023-04-01'
  AND c.data_particao = "2023-04-01"
GROUP BY b.subprefeitura
ORDER BY 2 DESC
LIMIT 1;



-- Pergunta 05	|	Resposta: Existe um chamado, com id 18516246, que não esta associado nenhuma informação de localização
SELECT COUNT(*) AS qtd
FROM `datario.administracao_servicos_publicos.chamado_1746` c
LEFT JOIN `datario.dados_mestres.bairro` b
ON c.id_bairro = b.id_bairro
WHERE DATE(c.data_inicio) = '2023-04-01'
    AND c.data_particao = "2023-04-01"
    AND (c.id_bairro IS NULL
      OR b.subprefeitura IS NULL);
/*  
    Apos uma breve analise, conclui-se que grande parte dos chamados que não tem informações de localização estão com a situação "encerrado", 
  a possibilidade de que ao finalizar o chamado não esteja colocando informações de localização como bairro
*/
-- Pode ser verificado utilizando a consulta abaixo
SELECT situacao, count(situacao) AS qtd
FROM `datario.administracao_servicos_publicos.chamado_1746`
WHERE data_particao = "2023-04-01"
    AND id_bairro IS NULL
GROUP BY situacao;



-- Pergunta 06	|	Resposta: 42408 Chamados abertos entre 01/01/2022 e 31/12/2023
SELECT Count(*)
FROM `datario.administracao_servicos_publicos.chamado_1746`
WHERE data_particao BETWEEN "2022-01-01" AND "2023-12-01"
    AND subtipo = "Perturbação do sossego";



-- Pergunta 07	|	Resposta: Foi selecionado os chamados que foram abertos, e a soma de chamados abertos nos eventos é de 1212 
SELECT Count(*) AS qtd_chamados_abertos
FROM `datario.administracao_servicos_publicos.chamado_1746` c
JOIN `datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos` e
ON DATE(c.data_inicio) BETWEEN e.data_inicial AND e.data_final
WHERE data_particao BETWEEN "2022-01-01" AND "2023-12-01"
    AND subtipo = "Perturbação do sossego";

  

-- Pergunta 08	|	Resposta: Rock in Rio = 834, Carnaval = 241, Reveillon = 137
SELECT e.evento, Count(*) AS qtd_chamados_abertos
FROM `datario.administracao_servicos_publicos.chamado_1746` c
JOIN `datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos` e
ON DATE(c.data_inicio) BETWEEN e.data_inicial AND e.data_final
WHERE data_particao BETWEEN "2022-01-01" AND "2023-12-01"
    AND subtipo = "Perturbação do sossego"
GROUP BY e.evento
ORDER BY 2 DESC;



-- Pergunta 09	|	Resposta: Rock in Rio, com uma média diária de aproximadamente 119 chamados abertos com o subtipo "Perturbação do sossego"
SELECT evento, ROUND(AVG(qtd_chamados_abertos)) AS media_diaria
FROM (
      SELECT DATE(c.data_inicio), e.evento, Count(*) AS qtd_chamados_abertos
      FROM `datario.administracao_servicos_publicos.chamado_1746` c
      JOIN `datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos` e
      ON DATE(c.data_inicio) BETWEEN e.data_inicial AND e.data_final
      WHERE data_particao BETWEEN "2022-01-01" AND "2023-12-01"
          AND subtipo = "Perturbação do sossego"
      GROUP BY e.evento, DATE(c.data_inicio)
)
GROUP BY evento
ORDER BY 2 DESC;



-- Pergunta 10
/*
Resposta: Após realizar um comparativo entre a média diária de chamados abertos entre os eventos e 
e periodo de 2022|2023. Chegou-se a conclusão de que a média diária de chamados abertos do periodo é maior que a 
do Carnaval e Reveillon, mas não é maior do que o Rock in Rio
*/
(SELECT evento, ROUND(AVG(qtd_chamados_abertos)) AS media_diaria
FROM (
      SELECT DATE(c.data_inicio), e.evento, Count(*) AS qtd_chamados_abertos
      FROM `datario.administracao_servicos_publicos.chamado_1746` c
      JOIN `datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos` e
      ON DATE(c.data_inicio) BETWEEN e.data_inicial AND e.data_final
      WHERE data_particao BETWEEN "2022-01-01" AND "2023-12-01"
          AND subtipo = "Perturbação do sossego"
      GROUP BY e.evento, DATE(c.data_inicio)
    )
GROUP BY evento
)
UNION ALL
(SELECT "periodo_2022_2023" AS evento,ROUND(AVG(qtd_chamados_abertos)) AS media_diaria
FROM (
  SELECT DATE(data_inicio) AS data_chamado, Count(*) AS qtd_chamados_abertos
  FROM `datario.administracao_servicos_publicos.chamado_1746` 
  WHERE data_particao BETWEEN "2022-01-01" AND "2023-12-01"
      AND subtipo = "Perturbação do sossego"
  GROUP BY DATE(data_inicio)
))
ORDER BY 2 DESC;
