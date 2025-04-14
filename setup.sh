#!/bin/bash

#echo "🔧 Instalando Docker y Docker Compose..."

## Instalar Docker si no está presente
#if ! command -v docker &> /dev/null; then
#    curl -fsSL https://get.docker.com -o get-docker.sh
#    sh get-docker.sh
#    sudo usermod -aG docker $USER
#    echo "✅ Docker instalado. Reinicia tu terminal si es necesario."
#fi

# Construir imágenes desde los Dockerfile locales
echo "🔨 Construyendo imágenes..."

echo "🛠️ Construyendo imágenes de JupyterLab ..."
docker build -t lalvarezl/jupyterlab:laal ./jupyterlab

echo "🛠️ Construyendo imágenes de MlFlow ..."
docker build -t lalvarezl/mlflow:laal ./mlflow

echo "🛠️ Construyendo imágenes de PostgresSQL ..."
docker build -t lalvarezl/postgresql:laal ./postgresql

# Ejecutar docker-compose con build
echo "🚀 Levantando servicios..."
docker-compose up -d --build
