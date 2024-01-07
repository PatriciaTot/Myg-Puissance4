# Myg-Puissance4

Le projet Myg-Puissance4 est une implémentation jeu de stratégie Connect 4 où deux joueurs s'affrontent pour aligner quatre de leurs jetons de couleur de manière horizontale, verticale ou diagonale sur une grille de 7 colonnes par 6 lignes.

## Instructions d'installation

### Installation de Bloc

Utilisez le playground Pharo et exécutez la commande suivante :
```Smalltalk
Metacello new
    baseline: 'Bloc';
    repository: 'github://pharo-graphics/Bloc:05e5b0e385811719537f8cd89966b150a07be985/src';
    onConflictUseIncoming;
    load;
    lock.
```

### Installation de Myg

Dans le playground, saisissez la commande suivante :
```Smalltalk
Author fullName: 'No'.
Metacello new
	repository: 'github://Ducasse/Myg:v1.0.1/src';
	baseline: 'Myg';
	onConflictUseLoaded;
	load.
```

### Installation du projet

Clonez le projet Myg-Puissance4 en utilisant Iceberg.
1. Cliquez sur `Clone from github.com`

2. Dans la fenêtre qui s'affiche, entrez les informations suivantes :

        a. Owner name --> PatriciaTot
        b. Project name --> Myg-Puissance4

3. Double-cliquez sur le projet Myg-Puissance4 chargé, puis chargez chacun des paquets, Myg-Puissance4 et Myg-Puissance4-Tests.

Vous pouvez maintenant explorer le code dans l'explorateur de classes.

### Exécution du projet

Dans le playground, lancez le jeu en utilisant la commande :

```Smalltalk
Puissance4 open.
```