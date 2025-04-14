FROM python:3.12-slim

# Instala herramientas necesarias
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Establece el directorio de trabajo
WORKDIR /app

# Instala MLflow y el conector para PostgreSQL
RUN pip install --upgrade pip && \
    pip install mlflow psycopg2-binary

# Expone el puerto por defecto de MLflow UI
EXPOSE 5000

# Comando por defecto para iniciar MLflow
CMD ["mlflow", "ui", "--host=0.0.0.0", "--port=5000"]