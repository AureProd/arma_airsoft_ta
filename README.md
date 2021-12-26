# Mission Airsoft de la team MOTA

## Logiciels requis

- [git](https://git-scm.com/downloads)
- [FileZilla](https://filezilla-project.org/download.php?type=client) (connectez-vous via le protocole ```sftp```) 
- [PBO Manager](https://www.armaholic.com/page.php?id=16369)
- [HeidiSQL](https://www.heidisql.com/download.php) (connectez-vous via le tunnel SSH)

## Installation de Screen

A ne pas faire si Screen est déjà installé

```
$ sudo apt update
$ sudo apt upgrade
$ sudo apt install screen
```

## Installation de la BDD

A ne pas faire si le site de la mota est déjà installé

### Installation de MySQL Server 

A ne pas faire si MySQL server est déjà installé

```
$ sudo apt update
$ sudo apt upgrade
$ sudo apt install mysql-server
$ sudo mysql_secure_installation
$ mysql -u root -p
$ CREATE USER '<USERNAME>'@'%' IDENTIFIED BY '<PASSWORD>';
$ GRANT ALL PRIVILEGES ON *.* TO '<USERNAME>'@'%' WITH GRANT OPTION;
```

### Création des bases de données

Via HeidiSQL, créez deux bases de données, la première pour le serveur principal, qu'on nomera ```airsoftdb``` et la seconde pour le serveur de développement, qu'on nomera ```airsoftdb_dev```.

### Importation des bases de données

Via HeidiSQL, importez le fichier [BDD.sql](autre/BDD.sql), dans la base de données ```airsoftdb``` et dans la base de données ```airsoftdb_dev```.

## Installation de Steam

A ne pas faire si Steam est déjà installé

```
$ useradd -m -s /bin/bash <USERNAME>
$ su <USERNAME>
$ mkdir ~/steam && cd ~/steam
$ curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
$ chmod +x steamcmd.sh
$ ./steamcmd.sh
```

## Récupération des fichiers de la mission (sur votre PC)

### Récupération du git

```
$ git clone git@github.com:HuetJB/arma_airsoft.git
```

### Récupération des mods de la mission

Abonnées vous à ces mods sur le workshop de steam (vous devez posséder Arma 3 pour qu'ils se téléchargent) et une fois qu'ils sont téléchargés, vous les trouvezrez dans le fichier ```Arma3/!Workshop/``` 

(Sous Windows, pour afficher le dossier ```!Workshop```, vous devez cochez l'option éléments masqués dans l'onglet affichage de l'explorateur de fichiers).

Mod : [@modairsoftta](https://steamcommunity.com/sharedfiles/filedetails/?id=1947636700)

### Génération des fichiers pbo de la mission

A l'aide de PBO Manager, générez le fichier mod_server.pbo du répertoire [mod_server](@mod_server/addons/mod_server) et le fichier NewAirsotf.Altis.pbo du répertoire [NewAirsotf.Altis](NewAirsotf.Altis).

## Installation du serveur principal

### Installation du serveur principal

A l'aide de FileZilla, copiez le fichier [airsoft_update.sh](autre/main/airsoft_update.sh) dans le répertoire ```~/```, puis faites les commandes suivantes :

```
$ cd
$ chmod +x airsoft_update.sh
$ ./airsoft_update.sh
```

### Importation des fichiers de la mission pour le serveur principal

A l'aide de FileZilla, copiez le fichier [run.sh](autre/main/run.sh) dans le répertoire ```~/airsoft/```, puis faites les commandes suivantes :

```
$ cd ~/airsoft
$ chmod +x run.sh
```

A l'aide de FileZilla, copiez le répertoire [@extDB3](@extDB3/) dans le répertoire ```~/airsoft/```, puis à l'aide de l'éditeur de FileZilla modifiez le fichier ```~/airsoft/@extDB3/extdb3-conf.ini``` : 

```
$ [Database]
$ IP = <BDD_ADDRESS>
$ Port = <BDD_PORT>
$ Username = <BDD_USERNAME>
$ Password = <BDD_PASSWORD>
$ Database = airsoftdb
```

A l'aide de FileZilla :

- copiez le fichier [server.cfg](autre/main/server.cfg) dans le répertoire ```~/airsoft/```

- copiez le fichier [server.cfg](autre/basic.cfg) dans le répertoire ```~/airsoft/```
- copiez le fichier [tbbmalloc.dll](autre/tbbmalloc.dll) dans le répertoire ```~/airsoft/```

- copiez le fichier [tbbmalloc_x64.dll](autre/tbbmalloc_x64.dll) dans le répertoire ```~/airsoft/```

- copiez le répertoire [@mod_server](@mod_server/) dans le répertoire ```~/airsoft/```, avec dans le dossier ```~/airsoft/@mod_server/addons/```, seulement le fichier mod_server.pbo (générer précédement)

- copiez le mod @modairsoftta (télécharger précédement) dans le répertoire ```~/airsoft/```

- copiez les fichiers bikey présent dans le dossier ```~/airsoft/@modairsoftta/addons/``` puis collez les dans le dossier ```~/airsoft/keys/```

- copiez dans le répertoire ```~/airsoft/mpmissions/```, le fichier NewAirsotf.Altis.pbo (générer précédement)

## Lancement et arrêt du serveur principal

### Lancement du serveur principal

```
$ screen -S airsoft
$ cd ~/airsoft
$ ./run.sh
$ ctrl + A + D
```

### Arrêt du serveur principal

```
$ screen -r airsoft
$ ctrl + C
$ ctrl + D
```

## Installation et lancement du serveur de développement

### Installation du serveur de développement

A l'aide de FileZilla, copiez le fichier [airsoft-dev_update.sh](autre/dev/airsoft-dev_update.sh) dans le répertoire ```~/```, puis faites les commandes suivantes :

```
$ cd
$ chmod +x airsoft-dev_update.sh
$ ./airsoft-dev_update.sh
```

### Importation des fichiers de la mission pour le serveur de développement

A l'aide de FileZilla, copiez le fichier [run.sh](autre/dev/run.sh) dans le répertoire ```~/airsoft-dev/```, puis faites les commandes suivantes :

```
$ cd ~/airsoft-dev
$ chmod +x run.sh
```

A l'aide de FileZilla, copiez le répertoire [@extDB3](@extDB3/) dans le répertoire ```~/airsoft-dev/```, puis à l'aide de l'éditeur de FileZilla modifiez le fichier ```~/airsoft-dev/@extDB3/extdb3-conf.ini``` : 

```
$ [Database]
$ IP = <BDD_ADDRESS>
$ Port = <BDD_PORT>
$ Username = <BDD_USERNAME>
$ Password = <BDD_PASSWORD>
$ Database = airsoftdb-dev
```

A l'aide de FileZilla :

- copiez le fichier [server.cfg](autre/dev/server.cfg) dans le répertoire ```~/airsoft-dev/```

- copiez le fichier [server.cfg](autre/basic.cfg) dans le répertoire ```~/airsoft-dev/```
- copiez le fichier [tbbmalloc.dll](autre/tbbmalloc.dll) dans le répertoire ```~/airsoft-dev/```

- copiez le fichier [tbbmalloc_x64.dll](autre/tbbmalloc_x64.dll) dans le répertoire ```~/airsoft-dev/```

- copiez le répertoire [@mod_server](@mod_server/) dans le répertoire ```~/airsoft-dev/```, avec dans le dossier ```~/airsoft-dev/@mod_server/addons/```, seulement le fichier mod_server.pbo (générer précédement)

- copiez le mod @modairsoftta (télécharger précédement) dans le répertoire ```~/airsoft-dev/```

- copiez les fichiers bikey présent dans le dossier ```~/airsoft/@modairsoftta/addons/``` puis collez les dans le dossier ```~/airsoft-dev/keys/```

- copiez dans le répertoire ```~/airsoft-dev/mpmissions/```, le fichier NewAirsotf.Altis.pbo (générer précédement)

## Lancement et arrêt du serveur de développement

### Lancement du serveur de développement

```
$ screen -S airsoft-dev
$ cd ~/airsoft-dev
$ ./run.sh
$ ctrl + A + D
```

### Arrêt du serveur de développement

```
$ screen -r airsoft-dev
$ ctrl + C
$ ctrl + D
```
