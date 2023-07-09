# Microservicios de bGames
[![es](https://img.shields.io/badge/lang-es-green.svg)](https://github.com/BlendedGames-bGames/bGames-dev-services/blob/master/misc/README-ES.md)
[![en](https://img.shields.io/badge/lang-en-blue.svg)](https://github.com/BlendedGames-bGames/bGames-dev-services/blob/master/README.md)

Estos microservicios se utilizan para la creación de videojuegos o componentes relacionados con bGames.

Existen dos maneras de utilizarlos: mediante Docker o de forma local.

------

# Instalación vía Docker

## Prerrequisitos
* [Docker](https://docs.docker.com/get-docker/) versión `24.0.4` o superior
* [Docker-Compose](https://docs.docker.com/compose/install/) versión `1.29.0` o superior

## Procedimiento
Una vez cumplidos los prerrequisitos, ejecuta los siguientes comandos en la consola:

```shell
git clone --recurse-submodule https://github.com/BlendedGames-bGames/bGames-dev-services.git
cd bGames-dev-services
docker-compose up
```

Las contraseñas y el usuario de la base de datos pueden ser modificados en el archivo docker-compose.yml antes de levantar los contenedores.

*Nota: Docker Compose podría necesitar ser ejecutado con sudo en sistemas Ubuntu*

# Instalación local
La instalación local se describe para el sistema operativo Ubuntu 22.04, aunque también puede realizarse en Windows 10 siguiendo su respectivo procedimiento.

## Prerrequisitos
* [Node.js](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-22-04) versión `v18.13.0` o superior
* [npm](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-22-04) versión `8.5.1` o superior
* [MySQL](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-22-04) versión `8.0.33` o superior

## Procedimiento
Una vez cumplidos los prerrequisitos, primero es necesario levantar la base de datos en MySQL con los datos preestablecidos. Para esto, primero se debe clonar el repositorio:

```shell
git clone --recurse-submodule https://github.com/BlendedGames-bGames/bGames-dev-services.git
cd bGames-dev-services
```

Luego se debe entrar a la carpeta de "db-init" y restaurar el volcado (dump) de bGames existente en dicha carpeta:

```shell
cd db-init
```

Para restaurar los datos, es necesario crear una base de datos y luego realizar el volcado, siguiendo la sintaxis a continuación:

```sql
mysql -u {usuario} -p
CREATE DATABASE {nombre base de datos};
USE  {nombre base de datos}
SOURCE  bGames_backup.sql
exit;
```

Por ejemplo:

```sql
mysql -u root -p
CREATE DATABASE mydatabase;
USE mydatabase
SOURCE bGames_backup.sql
exit;
```

Después, es necesario instalar los módulos de Node. Ubicado en la carpeta raíz del repositorio, puedes ejecutar el siguiente archivo shell, que abrirá tres terminales para instalar las dependencias:

```shell
sh manual-install.sh
```

Finalmente, cada vez que se quiera levantar los servicios, se debe usar la siguiente línea:

```shell
sh manual-start.sh
```
