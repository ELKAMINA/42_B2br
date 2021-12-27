Analyse du sujet : Born2beroot
Guide pour lùinstallation : https://baigal.medium.com/born2beroot-e6e26dfb50ac
Une adresse IP est un numéro didentification attribué à un ordinateur connecté à un réseau Internet. Concrètement, ce matricule sert à identifier les machines et à leur permettre de dialoguer entre elles, en échangeant des données sur Internet.

# Un serveur = dispo informatique qui offre différents services à des clients (en soi ce sont des ordis(grosse armoire avec pleins de tiroirs et chaque tiroir = ordi) mais avec les spécificités suivantes :
- grande puissance 
- bon débit en upload pour pouvoir rendre les tâches rapidement
- bon processeur pour rendre les scripts rapides
- processeur multicore pour faire pleins de tâches en même temps.
- bcp de Ram, pour mettre en cache 
Pas besoin de carte graphique ou carte son 

En informatique, un point de montage est un répertoire à partir duquel sont accessibles les données se trouvant sous forme dun système de fichiers sur une partition de disque dur ou un périphérique.

Comme pour lordinateur, on y installe un système dexploitation (Linux sans bureau, Windows Server OSX Server): Linux possède plusieurs distributions (certaines orientées bureau et dautres ortientées service) (Debian/Centos/Ubuntu/Fedora/Archlinux).
Pourquoi Debian ?
Debian est une distri 
- Stable 
- facile a utiliser
- mise a jour ne sont pas trop fréquentes ( av : version stable et packages bien mis à jour et sécurisés)

# Partition : http://www.minix3.org/doc/partitions-french.html
= découpage du disque dur en plusieurs parties => Partitions.
Il nest pas possible dutiliser un disque sil na pas été découpé en partitions.
3 types de partition : 
- logique : stockage des données
- étendue 
- primaire : pour OS
Un DD peut avoir jusqua 4 partitions primaires avec un max de 2 To max/partition pour les anciens (MBR/BIOS). Aujourdhui, et vu que la capacite de stockage a augmente, creation de GPT/UEFI pouvant contenir jusqua 128 partitions max et 256to/partition.
Le point de montage est le répertoire de larborescence qui abritera le contenu du système de fichiers de la partition sélectionnée. Ainsi, une partition montée sur /home/ est traditionnellement prévue pour contenir les données des utilisateurs.
Si ce répertoire se nomme « / », on parle alors de la racine de larborescence, donc de la partition qui va réellement accueillir le système Debian.
une des quatre partitions primaires peut être désignée comme une partition étendue qui peut être divisé en plusieurs logique partitions. Les partitions logiques ne peuvent jamais être des partitions primaires.
Une partition étendue permet jusquà 24 partitions de disques logiques. 

En sélectionnant une partition, on peut indiquer la manière dont on va lutiliser :
    >la formater et lintégrer à larborescence en choisissant un point de montage ;
    >lemployer comme partition déchange (swap) ;
    >en faire un volume physique pour chiffrement (pour protéger la confidentialité des données de certaines partitions, voir plus loin) ;
    >en faire un volume physique pour LVM (notion détaillée plus loin dans ce chapitre) ;   
    >lutiliser comme périphérique RAID (voir plus loin dans ce chapitre) ;
    >ou ne pas lexploiter et la laisser inchangée.

# LVM
LVM, ou Logical Volume Manager, est une autre approche servant à abstraire les volumes logiques des disques physiques. Le but principal nétait pas ici de gagner en fiabilité des données mais en souplesse dutilisation. LVM permet en effet de modifier dynamiquement un volume logique, en toute transparence du point de vue des applications. Par exemple, on peut ainsi ajouter de nouveaux disques, migrer les données dessus et récupérer les anciens disques ainsi libérés, sans démonter le volume.



#SELinux et AppArmor
AppArmor = Cree justement pour pallier aux difficultes de SElinux. logiciel de securite pour Linux. AppArmor permet à ladministrateur système dassocier à chaque programme un profil de sécurité qui restreint ses accès au système dexploitation
SELinux =  Security Enhanced linux.
# Comment faire pour créer un serveur 
1. Pour installer des serveurs, il faut des logiciels particuliers pour permettre au serveu de faire à certaines choses(envoi de mails, recup de ip.... comme Mongo DB, Postfix, Bind9, iptables, Apache...)

2. Faire de la virtualisation : faire fonctionner un ordinateur dans un ordinateur. On simule une vraie machine dans notre ordi.

Grub = permet dindiquer à lordinateur sur quoi il doit installer

# Commandes de base pour Linux
- cd 
- ls
    - ls -R : affiche de manière récursive
    - ls -t : affiche les fichiers et les trie par date de modif.
    - ls -tF :  permet de rajouter un slash a la fin.
    - ls -F
- chmod : changement de droits 

# Commandes spécfiques pour Debian
- dpkg = package manager for Debian. pkg is a tool to install, build, remove and manage Debian
       packages. The primary and more user-friendly front-end for dpkg
       is aptitude(1). dpkg itself is controlled entirely via command
       line parameters, which consist of exactly one action and zero or
       more options. The action-parameter tells dpkg what to do and
       options control the behavior of the action in some way.
- sudo : "substitute user do", "super user do"  ou "switch user do" = « se substituer à lutilisateur pour faire », « faire en tant que super-utilisateur  » ou « changer dutilisateur pour faire »
Cette commande permet à un administrateur système daccorder à certains utilisateurs (ou groupes dutilisateurs) la possibilité de lancer une commande en tant quadministrateur, ou en tant quautre utilisateur, tout en conservant une trace des commandes saisies et des arguments.
- lsblk : La commande lsblk permet dobtenir la liste et les caractéristiques des disques et de leurs partitions.
La commande ne nécessite pas les droits administrateurs pour être exécutée.

# Architecture de Linux = A partir de la racine :
- bin et sbin = contient tous les exécutables utiles pr le systeme
- usr : dossier de de lutilisateur qui a bin également et contient tous 
- etc : config de tous nos logiciels (vont être stockés les dif confg)
- mnt et media : permettent de monter les choses (quand on a des CD ou autre -> cest dans mnt)
- root : correspond à lutilisateur root (administrateur)
- serveu
- boot
- opt : optional pr stocker des choses qui ne rentrent pas dans larchi Linux.
- var : TRES IMPORTANT accessible en écriture et va contenir tous les fichiers qui vont etre modifiés
    - backup 
    - cash
    - log
    - reboot : pour redémarrer
- home : dossier qui va correspondre aux diff utilisateurs 
- Si on veut faire des commandes dont la propriété est root, il faut utiliser : sudo.
Pour se connecter en tant que root : sudo -s
Pour quitter : exit 

# Gestionnaire de paquets : 
apt = Advanced Packaging Tool (outil de paquetage avancé)
APT simplifie linstallation, la mise à jour et la désinstallation de logiciels en automatisant la récupération de paquets à partir de sources APT (sur Internet, le réseau local, des CD-ROM, etc.), la gestion des dépendances et parfois la compilation

- Récupérer un logiciel et linstaller de maniere auto
- Pour appeler le gestionnaire de paquet : apt-get + ... 
- Pour installer  un paquets : apt-get install
- Mettre à jour la liste des dépots/sources  : apt-get update (avec sudo)
- Mettre à jour la distribution (notamment Debian) : apt-get update

# Pour communiquer avec le serveur à distance => protocole SSH
ssh = Secure SHell = protocole qui permet de faire des connexions sécurisées(cryptées) entre un serveur et un client SSH.
Pour faire cela, on doit configurer notre machine virtuelle. Quand tu vas sur le port XXXX, tu essaieras de te co à le IP de la machine virtuelle.
Pour trouver IP de la machine virtuelle :  ip a

# Pour améliorer la sécurité :
Mots clés : 
- Un daemon : Disk And Execution MONitor (moniteur de disque et dexécution)  -----> désigne un programme informatique ou un processus qui nest pas contrôlé par lutilisateur et qui sexécute en arrière-plan.
Le rôle principal du daemon consiste à apporter une réponse à une ou plusieurs requêtes dun réseau, dun matériel ou dun programme. Les daemons opèrent lors du démarrage dun ordinateur et lors du chargement dun système dexploitation. 

- Démon SSH dOpen SSH correspond à sshd => démon SSH
Ils fournissent des communications sécurisées et cryptées entre deux machines qui ne sont pas sûres, et ce, sur un réseau non sécurisé. Ces programmes ont pour but dêtre les plus simples possibles à installer et à utiliser.

sshd est le démon qui attend des connexions des clients. Il est normalement démarré à lamorçage de la machine (boot) depuis /etc/rc Il crée un nouveau démon à chaque connexion entrante. Les démons créés prennent en charge léchange de clef, le cryptage, lauthentification, lexécution de commandes et léchange de données. Cette implémentation de sshd supporte simultanément les versions 1 et 2 du protocole SSH. sshd fonctionne comme décrit ci-après. 


1. Modifier le fichier de configuration - Attention le fichier contient des # : ce sont des commentaires et les données sont par défaut : 
    - Aller à partir de la racine à : /etc/ssh/
    - Ouvrir fichier de config ssh : vi sshd_config
    - Modifier le port : 22
    - Modifier le PermitRootLogin "without password" en "no" => Ne pas permettre à lutilisateur root de se connecter
2. Si on veut accéder à notre machine : ssh ael-khat@iphost -p XXXX avec XXXX le port que lon a configure dans les param de la VM et dans sshd_config

Attention, pour passer de root à user : EXIT

3. On peut configurer notre ssh et le sécuriser plus avec une clé :
    - ssh-keygen -t rsa ou dsa -b (nbre de bits) 4096 -C "elkamina@yahoo.com"
    - Ceci génère une clé publique et privée
    - créer un dossier .ssh avec tous les droits
    - créer un fichier "authorized_keys" avec chmod 600
    - y copier coller la clé publique 
    - et relancer la session
    - Ils demanderont de saisir mdp
    - on revient en sudo -s pour passer en root et ensuite etc/sshd_config => On modifie PasswordAuthentification de yes a no. Personne ne pourra plus se connecter ac un mdp

4. On peut aussi encore configurer pour sécuriser encore plus :
- Limiter à des ips particulières.

Avec OVH, on peut recover notre serveur au cas où.

CRON et CRONTab ; tache recurrente 
Quand on adminitre un sys, on a recours a des taches recurrentes (ex : si jai un site de-commerce => jenvoie des factures tous les mois a mes clients)
- crontab -l  #Pour lister toutes les taches en cours 
- crontab -e # Pour ajouter ou modifier de taches mais on a besoin dun editeur : NANO

IPTABLES 
Installer un parefeu pour controler les connexions entrantes et sortantes
on va tout fermer et rouvrir que les ports que lon souhaite 
- Pour savoir sil existe dans notre ordi  : sudo iptables sinon : apt-get install

#Confguration : Partie obligatoire 

1. installer sudo (il faut etr en root)
