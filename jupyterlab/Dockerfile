FROM python:3.12-slim

# Instala herramientas necesarias
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    build-essential \
    supervisor \
    && rm -rf /var/lib/apt/lists/*

# Establece el directorio de trabajo
WORKDIR /app

# Instala paquetes de Python
RUN pip install --upgrade pip && \
    pip install --no-cache-dir \
        jupyterlab \
        pandas \
        scikit-learn

# Copia el archivo de configuración de Supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expone los puertos de JupyterLab
EXPOSE 8888

# Comando por defecto: iniciar supervisord
CMD ["/usr/bin/supervisord"]
