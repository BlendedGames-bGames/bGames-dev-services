@echo off

cd "Get routes microservice"
start cmd /k npm run dev
cd ..

cd "Post routes microservice"
start cmd /k npm run dev
cd ..

cd "User routes microservice"
start cmd /k npm run dev
cd ..

echo Todas los servicios se han iniciado.
