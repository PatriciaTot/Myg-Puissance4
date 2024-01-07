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

a. Owner

    PatriciaTot

b. Project name
    
        Myg-Puissance4

3. Double-cliquez sur le projet Myg-Puissance4 chargé, puis chargez chacun des paquetages, Myg-Puissance4 et Myg-Puissance4-Tests.

Vous pouvez maintenant explorer le code dans l'explorateur de classes.

### Exécution du projet

Dans le playground, lancez le jeu en utilisant la commande :

```Smalltalk
Puissance4 open.
```
  
![Page1](https://i.goopics.net/b16vgw.png)
  
![Winning](https://i.goopics.net/jcxa7a.png)

## Emplacement du code/tests

Le code source du projet est organisé dans le paquetage Myg-Puissance4. Ce paquetage est subdivisé en deux sous-paquets principaux : Core et UI. En outre, les tests sont regroupés dans le paquetage Myg-Puissance4-Tests.

### Organisation du code

#### Paquetage Core

Le paquetage Core rassemble les classes responsables de la logique de jeu. Vous y trouverez des classes clées telles que P4Game (qui représente l'état du jeu), P4Cell (représentant chaque cellule du jeu), et P4Player (représentant un joueur).

#### Paquetage UI

Le paquetage UI est dédié à l'interface utilisateur du jeu. Il tire parti du framework Bloc, installé précédemment. Au sein de ce paquetage, la classe P4CellElement incarne la partie graphique d'une cellule. La classe Puissance4 joue le rôle de l'affichage graphique du jeu et la gestion des interactions avec l'utilisateur.

### Tests

#### Paquetage Myg-Puissance4-Tests

Le paquetage Myg-Puissance4-Tests regroupe des tests unitaires et de validation qui garantissent le bon fonctionnement de la logique du jeu. Le développement a suivi la méthodologie TDD.

Notons que la partie graphique n'a pas fait l'objet de tests unitaires, la vérification visuelle étant effectuée manuellement.
  
![Dr Tests](https://i.goopics.net/iqclyk.png)

## Remarques sur la première version

Cette version de Myg-Puissance4 propose une implémentation de base. Pour des améliorations futures, on pourrait considérer :
- Externaliser la gestion des messages de l'affichage du vainqueur dans une classe dédiée, côté UI.
- Éviter la duplication de code dans les algorithmes de vérification d'alignement et décomposer les méthodes plus longues en plusieurs étapes distinctes.
- Ajouter des tests pour garantir la stabilité de l'interface utilisateur.
- Améliorier l'UI avec plus d'animations. Ce projet a été une première incursion dans la création d'interfaces utilisateur avec Bloc.