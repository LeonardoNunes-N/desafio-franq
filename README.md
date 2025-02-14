# desafio-franq

Neste processo é realizado o calculo de score dos candidatos de uma base de RH e suas candituras de vagas, seu processamento inteiro é realizado no notebook app/notebooks/score_rh.ipynb

O projeto segue uma arquitetura de arquivos fixa

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


Arquivos necessarios para que o processamento ocorra corretamente
* app/data/teste___desafio_técnico_-_analista_de_dados_pleno_anexo.db
* app/scripts/canditados_pre_selecionados.sql
* app/scripts/tratamento_db.sql 

Para rodar o processamento é necessário os comandos: 
1. docker-compose up  
2. docker-compose build 
OU 
1. docker-compose up --build

