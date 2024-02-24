# Resolução do desafio técnico para Cientista de Dados Júnior no Escritório Municipal de Dados do Rio de Janeiro

## Índice

- [Sobre](#about)
- [Conjunto de Dados Utilizados no Desafio](#dataset)
- [Respostas SQL](#runsql)
- [Respostas Python](#runpython)
- [Respostas PowerBI](#runpowerbi)
<br>

## Sobre <a name = "about"></a>


O desafio técnico para a vaga de Cientista de Dados Júnior no Escritório Municipal de Dados do Rio de Janeiro tem como objetivo de avaliar minhas habilidades técnicas, respondendo perguntas específicas sobre os dados disponibilizados utilizando SQL, Python, BigQuery e ferramentas de visualização.

## Conjunto de Dados Utilizados no Desafio<a name = "dataset"></a>

Os conjuntos de dados que serão utilizados no desafio são:

- **Chamados do 1746:** Dados relacionados a chamados de serviços públicos na cidade do Rio de Janeiro. O caminho da tabela é : `datario.administracao_servicos_publicos.chamado_1746`
- **Bairros do Rio de Janeiro:** Dados sobre os bairros da cidade do Rio de Janeiro - RJ. O caminho da tabela é: `datario.dados_mestres.bairro`
- **Ocupação Hoteleira em Grandes Eventos no Rio**: Dados contendo o período de duração de alguns grandes eventos que ocorreram no Rio de Janeiro em 2022 e 2023 e a taxa de ocupação hoteleira da cidade nesses períodos. O caminho da tabela é: `datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos`

## Respostas com SQL <a name = "runsql"></a>

### Requisitos
- <a href="https://docs.dados.rio/tutoriais/como-acessar-dados/#como-criar-uma-conta-na-gcp">Conta GCP</a>
- <a href="https://docs.dados.rio/tutoriais/como-acessar-dados">Acesso os dados do Desafio</a>


Após ter criado uma conta no GCP e realizado o acesso aos dados do desafio pelo BigQuery, crie uma consulta SQL no BigQuery e execute individualmente os comandos localizados no arquivo <b>analise_sql.sql</b> para visualizar a resolução das perguntas.

## Respostas com Python <a name = "runpython"></a>

### Requisitos
- <a href="https://colab.research.google.com/notebooks/welcome.ipynb?hl=pt-BR">Conta GCP</a>
- <a href="https://docs.dados.rio/tutoriais/como-acessar-dados/#como-criar-uma-conta-na-gcp">Conta no Google Colab</a>
- <a href="https://docs.dados.rio/tutoriais/como-acessar-dados">Acesso os dados do Desafio</a>

Após ter criado uma conta no GCP e realizado o acesso aos dados do desafio pelo BigQuery. Acesse o <a href="https://colab.research.google.com/drive/16ykds_61hR0fAIWZ_psdz8wnKWwEh9_s?usp=sharing">notebook com respostas em python</a> e na variavel <b>project_id</b> coloque o id do seu projeto do GCP, em seguida execute o codigo para visualizar os resultados.

## Respostas com Power BI <a name = "runpowerbi"></a>

### Requisitos

- <a href="https://www.microsoft.com/pt-br/download/details.aspx?id=58494">Power BI</a>

Com o Power BI Desktop instalado, abra o arquivo <b>analise_powerbi.pbix</b>.