@echo off

cd "Get routes microservice"
start cmd /k npm install
cd ..

cd "Post routes microservice"
start cmd /k npm install
cd ..

cd "User routes microservice"
start cmd /k npm install
cd ..

echo Todas las instalaciones han iniciado.
