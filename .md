## Configuration d'un conteneur LXC

#### Installez LXC sur votre système hôte :

`sudo apt-get install lxc`

#### Créez un conteneur LXC :
`sudo lxc-create -n monconteneur -t download -- -d ubuntu -r bionic -a amd64`

#### Démarrez le conteneur : 
`sudo lxc-start -n monconteneur`

#### Connectez-vous au conteneur :
`sudo lxc-attach -n monconteneur`

## Installation des dépendances :

#### Mettez à jour les paquets du conteneur :
`sudo apt-get updater`

#### Installez Apache, MySQL et PHP : 
`sudo apt-get install apache2 mysql-server php `


#### Installez les extensions PHP nécessaires pour Drupal version 9.4.5 :
`sudo apt install php php-mysql php-cli php-json php-opcache php-gd php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip`

`sudo apt-get install php-gd php-xml php-mbstring `

`sudo apt install php8.0-mbstring`

 `sudo apt install php8.0-mysql`

 `sudo apt install php8.0-pgsql`
 
## Création de la base de données MySQL

#### Connectez-vous à MySQL :
`mysql -u root -p`

#### Entrez votre mot de passe root MySQL lorsque vous y êtes invité.

#### Créez une nouvelle base de données pour Drupal :
`CREATE DATABASE drupal9;`


#### Créez un nouvel utilisateur pour Drupal :
`CREATE USER 'root'@'localhost' IDENTIFIED BY 'root';`

##### Accordez tous les privilèges à l'utilisateur sur la base de données :
`GRANT ALL PRIVILEGES ON drupal5.* TO 'root'@'localhost';`

#### Rechargez les privilèges :
`FLUSH PRIVILEGES;`

#### Quittez MySQL :
`exit`

## Téléchargement et configuration de Drupal

#### télécharger Drupal version 9.4.5

`wget https://www.drupal.org/download-latest/tar.gz -O drupal.tar.gz`

#### extract drupal.tar.gz

`tar -xvf drupal.tar.gz`

#### Déplacez le dossier Drupal vers le répertoire HTML d'Apache :

`sudo mv drupal-x.x.x /var/www/drupal`

## renommer le dossier drupal
`sudo mv /var/www/drupal* /var/www/drupal`

## créer un nouveau fichier drupal.conf pour configurer le site
`sudo nano /etc/apache2/sites-available/drupal.conf`

#### Collez la configuration suivante dans drupal.conf

Alias /drupal "/var/www/drupal/"
<Directory /var/www/drupal/>
    AllowOverride All
</Directory>


#### activer le site Drupal et les modules PHP requis

`sudo a2ensite drupal`
`sudo a2enmod rewrite`
`sudo chown -R www-data:www-data /var/www/drupal`
`sudo chmod -R 755 /var/www/drupal`

#### redémarrer le service apache2

`sudo systemctl restart apache2`

## Configuration de Drupal

http://adresse_ip_conteneur/drupal

