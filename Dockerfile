FROM python:3.9

WORKDIR /app

# Atualiza o pip antes de instalar as dependências
RUN pip install --upgrade pip

# Instalar dependências necessárias
RUN pip install pandas tabulate jupyter notebook
# Copiar arquivos do projeto para dentro do container
COPY . /app

# Comando padrão ao iniciar o container
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root"]
