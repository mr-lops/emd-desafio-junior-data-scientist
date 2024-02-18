-- Pergunta 01	|	Resposta: foi aberto 73 chamados
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
SELECT bair.nome as nome_bairro, COUNT(bair.nome) as qtd_chamados
FROM `datario.administracao_servicos_publicos.chamado_1746` cham
LEFT JOIN `datario.dados_mestres.bairro` bair
ON cham.id_bairro = bair.id_bairro
WHERE DATE(cham.data_inicio) = '2023-04-01'
  AND cham.data_particao = "2023-04-01"
GROUP BY bair.nome
ORDER BY 2 DESC
LIMIT 3;



-- Pergunta 04	|	Resposta: Zona Norte=25
SELECT bair.subprefeitura, COUNT(bair.subprefeitura) as qtd_chamados
FROM `datario.administracao_servicos_publicos.chamado_1746` cham
LEFT JOIN `datario.dados_mestres.bairro` bair
ON cham.id_bairro = bair.id_bairro
WHERE DATE(cham.data_inicio) = '2023-04-01'
  AND cham.data_particao = "2023-04-01"
GROUP BY bair.subprefeitura
ORDER BY 2 DESC
LIMIT 1;



-- Pergunta 05	|	Resposta: Existe um chamado, com id 18516246, que não esta associado nenhuma informação de localização
SELECT COUNT(*)
FROM `datario.administracao_servicos_publicos.chamado_1746` cham
LEFT JOIN `datario.dados_mestres.bairro` bair
ON cham.id_bairro = bair.id_bairro
WHERE DATE(cham.data_inicio) = '2023-04-01'
  AND cham.data_particao = "2023-04-01"
  AND (cham.id_bairro IS NULL
      OR bair.subprefeitura IS NULL);

/*  
    Apos uma breve analise, conclui que grande parte dos chamados que não tem informações de localização estão com a situação "encerrado", 
  a possibilidade de que ao finalizar o chamado não esteja colocando informações de localização como bairro
*/
-- Pode ser verificado utilizando a consulta abaixo

SELECT situacao, count(situacao)
FROM `datario.administracao_servicos_publicos.chamado_1746` cham
WHERE cham.data_particao = "2023-04-01"
AND cham.id_bairro IS NULL
group by cham.situacao



-- Pergunta 06	|	Resposta: