#!/bin/bash

# Función para instalar los paquetes de Node.js en paralelo
install_in_parallel() {
  # Entra en el directorio dado como argumento
  cd "$1" || exit
  echo "Instalando paquetes en $1..."

  # Ejecuta npm install en segundo plano
  npm install &

  # Regresa al directorio original
  cd - || exit
}

# Directorios de los microservicios
microservices=("Get routes microservice" "Post routes microservice" "User routes microservice")

# Instala los paquetes en paralelo para cada microservicio
for microservice in "${microservices[@]}"; do
  install_in_parallel "$microservice"
done

# Espera a que finalicen todas las instalaciones en paralelo
wait

echo "Todas las instalaciones han finalizado."
