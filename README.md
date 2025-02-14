# Desafio Técnico - Analista de Dados Pleno

Neste processo é realizado o cálculo de score dos candidatos de uma base de RH e suas candidaturas a vagas. Todo o processamento é executado no notebook localizado em app/notebooks/score_rh.ipynb.

## Arquitetura de Arquivos

O projeto segue uma arquitetura de arquivos fixa para facilitar a organização e execução. A estrutura é a seguinte:

* /desafio_analista_dados
* │── Dockerfile
* │── docker-compose.yml
* │── scripts/
* │   ├── candidatos_pre_selecionados.sql
* │   ├── tratamento_db.sql
* │── notebooks/
* │   ├── score_rh.ipynb
* │── data/
* │   ├── banco.sqlite
* │── output/

## Descrição dos Arquivos

* Dockerfile: Define a configuração do ambiente Docker para o processamento.
* docker-compose.yml: Orquestra os containers necessários para rodar o projeto.
* scripts/candidatos_pre_selecionados.sql: Script SQL para a seleção dos candidatos.
* scripts/tratamento_db.sql: Script SQL para o tratamento da base de dados.
* notebooks/score_rh.ipynb: Notebook onde o cálculo do score dos candidatos é realizado.
* data/banco.sqlite: Banco de dados SQLite com as informações para o processamento.
* output/: Pasta onde os resultados csvs serão armazenados.
## Arquivos Necessários

Para que o processamento aconteça corretamente, os seguintes arquivos são necessários:

* app/data/teste___desafio_técnico_-_analista_de_dados_pleno_anexo.db
* app/scripts/candidatos_pre_selecionados.sql
* app/scripts/tratamento_db.sql 
## Como Rodar o Processamento
### **NECESSÁRIO DOCKER ENGINE NO AMBIENTE PARA RODAR**
### Opção 1: Construir as imagens e depois rodar os containers

1. Construir as imagens: docker-compose build
2. Rodar os containers: docker-compose up
### Opção 2: Rodar o build e os containers em um único comando Se preferir rodar ambos os passos de uma vez, utilize o comando abaixo:

1. docker-compose up --build

### Esse comando irá:

1. Construir as imagens.
2. Rodar os containers.
## Resultados

Os resultados do processamento serão gerados e armazenados na pasta output/. 

## Possíveis Melhorias:
* **Tratamento de Dados>** Realizar o tratamento dos dados após a inserção no banco de dados, permitindo maior flexibilidade no processo de transformação dos dados.

* **Cálculo do Score de Competência:** Após uma discussão com o time de RH, desenvolver uma lógica que considere pesos por nível de competência, em vez de basear-se apenas na quantidade de competências.

* **Incoerência nas Vagas de Inscrição:** Após conversa com o time de RH, determinar a melhor forma de visualizar candidatos que apresentem incoerência nas vagas nas quais se inscrevem. Além disso, avaliar a necessidade de atribuir um peso negativo no score desses candidatos.

* **Especialistas e Incoerência:** Após uma conversa com o time de RH, definir a melhor forma de apresentar os resultados da verificação de especialistas e, caso necessário, discutir a aplicação de um peso positivo no score dos candidatos com essa incoerência, e o impacto disso no cálculo.

* **Sinalização de Especialistas:** Após consulta com o time de RH, revisar a abordagem de sinalização dos resultados da verificação de especialistas e avaliar a necessidade de atribuir um peso positivo no score, bem como definir a magnitude desse peso. 

* **Automatizacao do processamento:** Com o Docker, é possível orquestrar sua execução de forma simplificada, bastando definir a ferramenta mais adequada para essa finalidade.
  * Cron (Linux/macOS)
  * Systemd (Linux)
  * Kubernetes CronJobs
  * Nuvem(GCP Kubernets, AWS, AZURE)


