Analyse du sujet : Born2beroot

# Un serveur = dispo informatique qui offre différents services à des clients (en soi ce sont des ordis(grosse armoire avec pleins de tiroirs et chaque tiroir = ordi) mais avec les spécificités suivantes :
- grande puissance 
- bon débit en upload pour pouvoir rendre les tâches rapidement
- bon processeur pour rendre les scripts rapides
- processeur multicore pour faire pleins de tâches en même temps.
- bcp de Ram, pour mettre en cache 
Pas besoin de carte graphique ou carte son 

Comme pour lordinateur, on y installe un système dexploitation (Linux sans bureau, Windows Server OSX Server): Linux possède plusieurs distributions (certaines orientées bureau et dautres ortientées service) (Debian/Centos/Ubuntu/Fedora/Archlinux).
Pourquoi Debian ?
Debian est une distri 
- Stable 
- facile a utiliser
- mise a jour ne sont pas trop fréquentes ( av : version stable et packages bien mis à jour et sécurisés)

# Partition
= découpage du disque dur en plusieurs parties => Partitions.
Il nest pas possible dutiliser un disque sil na pas été découpé en partitions.

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