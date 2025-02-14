# Desafio Técnico - Analista de Dados Pleno

Neste processo é realizado o cálculo de score dos candidatos de uma base de RH e suas candidaturas a vagas. Todo o processamento é executado no notebook localizado em app/notebooks/score_rh.ipynb.

## Arquitetura de Arquivos

O projeto segue uma arquitetura de arquivos fixa para facilitar a organização e execução. A estrutura é a seguinte:

/desafio_analista_dados
│── Dockerfile
│── docker-compose.yml
│── scripts/
│   ├── candidatos_pre_selecionados.sql
│   ├── tratamento_db.sql
│── notebooks/
│   ├── score_rh.ipynb
│── data/
│   ├── banco.sqlite
│── output/

## Descrição dos Arquivos

* Dockerfile: Define a configuração do ambiente Docker para o processamento.
* docker-compose.yml: Orquestra os containers necessários para rodar o projeto.
* scripts/candidatos_pre_selecionados.sql: Script SQL para a seleção dos candidatos.
* scripts/tratamento_db.sql: Script SQL para o tratamento da base de dados.
* notebooks/score_rh.ipynb: Notebook onde o cálculo do score dos candidatos é realizado.
* data/banco.sqlite: Banco de dados SQLite com as informações para o processamento.
* output/: Pasta onde os resultados serão armazenados.
## Arquivos Necessários

Para que o processamento aconteça corretamente, os seguintes arquivos são necessários:

* app/data/teste___desafio_técnico_-_analista_de_dados_pleno_anexo.db
* app/scripts/candidatos_pre_selecionados.sql
* app/scripts/tratamento_db.sql
## Como Rodar o Processamento

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

