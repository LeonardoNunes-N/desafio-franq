FROM python:3.9

WORKDIR /app

# Atualiza o pip antes de instalar as dependências
RUN pip install --upgrade pip

# Instalar dependências necessárias
RUN pip install pandas tabulate jupyter notebook nbconvert ipykernel

# Copiar arquivos do projeto para dentro do container
COPY . /app

# Configurar o kernel do Jupyter
RUN python -m ipykernel install --user --name=python3 --display-name "Python 3"

# Executar automaticamente o notebook ao iniciar o container
CMD ["bash", "-c", "jupyter nbconvert --to notebook --execute notebooks/score_rh.ipynb --output score_rh_output.ipynb --ExecutePreprocessor.kernel_name=python3 && cat score_rh_output.ipynb"]