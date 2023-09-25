# bGames Microservices
[![es](https://img.shields.io/badge/lang-es-green.svg)](https://github.com/BlendedGames-bGames/bGames-dev-services/blob/master/misc/README-ES.md)
[![en](https://img.shields.io/badge/lang-en-blue.svg)](https://github.com/BlendedGames-bGames/bGames-dev-services/blob/master/README.md)

These microservices are used for the creation of videogames or related components for bGames.

There are two ways to use them: via Docker or locally.

------

# Docker Installation

## Prerequisites
* [Docker](https://docs.docker.com/get-docker/) version `24.0.4` or higher
* [Docker-Compose](https://docs.docker.com/compose/install/) version `1.29.0` or higher

## Procedure
Once the prerequisites are met, execute the following commands in the console:


```shell
git clone --recurse-submodule https://github.com/BlendedGames-bGames/bGames-dev-services.git
cd bGames-dev-services
docker-compose up
```

The passwords and the user for the database can be modified in the docker-compose.yml file before lifting the containers.

*Note: Docker Compose might need to be executed with sudo in Ubuntu systems*

# Local Installation
The local installation is described for the Ubuntu 22.04 operating system, although it can also be performed on Windows 10 following its respective procedure.

## Prerequisites
* [Node.js](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-22-04) version `v18.13.0` or higher
* [npm](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-22-04) version `8.5.1` or higher
* [MySQL](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-22-04) version `8.0.33` or higher

## Procedure
Once the prerequisites are met, it is first necessary to start the MySQL database with the preset data. For this, first you need to clone the repository:

```shell
git clone --recurse-submodule https://github.com/BlendedGames-bGames/bGames-dev-services.git
cd bGames-dev-services
```

Then you should go into the "db-init" folder and restore the bGames dump located in this folder:

```shell
cd db-init
```

To restore the data, it is necessary to create a database and then perform the dump, following the syntax below:

```sql
mysql -u {user} -p
CREATE DATABASE {database name};
USE  {database name}
SOURCE  bGames_backup.sql
exit;
```

For example:

```sql
mysql -u root -p
CREATE DATABASE mydatabase;
USE mydatabase
SOURCE bGames_backup.sql
exit;
```
In turn, the credentials for each microservice must also be changed. Go to `'<microservice>/src/database.js'` and replace the fields in the `'mysqlConnection'` variable.

Example variable:
```
var mysqlConnection = mysql.createPool({
    connectionLimit : 1000,
    connectTimeout : 60 * 60 * 1000,
    acquireTimeout : 60 * 60 * 1000,
    timeout : 60 * 60 * 1000,
    host:'localhost',
    port:'3306',
    user:'root',
    password:'password',
    database: 'mydatabase',
    multipleStatements:true
});
```
Next, it is necessary to install the Node modules. From the root folder of the repository, you can execute the following shell file, which will open three terminals to install the dependencies:

```shell
sh manual-install.sh
```

Finally, each time you want to start the services, you should use the following line:

```shell
sh manual-start.sh
```
*Note: In case you get an error by @babel/node execute the following command before initializing.*
```
npm i -g @babel/node
```
