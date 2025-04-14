#!/bin/bash

echo "🚨 Eliminando todos los contenedores, imágenes, volúmenes y redes sin uso..."

# Detener todos los contenedores
echo "🗑️ Deteniendo todos los contenedores ..."
docker stop $(docker ps -aq) 2>/dev/null

# Eliminar todos los contenedores
echo "🗑️ Eliminando todos los contenedores ..."
docker rm $(docker ps -aq) 2>/dev/null

# Eliminar todas las imágenes
echo "🗑️ Eliminando todas las imágenes ..."
docker rmi -f $(docker images -q) 2>/dev/null

# Eliminar todos los volúmenes
echo "🗑️ Eliminando todos los volúmenes ..."
docker volume prune -f

# Eliminar redes no usadas (excepto bridge, host y none)
echo "🗑️ Eliminando redes no usadas ..."
docker network prune -f

echo "✅ Todo limpio. Docker está como nuevo."
