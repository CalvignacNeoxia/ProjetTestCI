# Projet : Créez l’application Reciplease… pour de bons petits plats !
## Reciplease

**Compétences évaluées**
-

- Gérer une Table View
- Utiliser le delegate pattern
- Sauvegarder des données avec Core Data
- Utiliser une librairie open source

**Competencies evaluated**
-

- Manage a Table View
- Using the delegate pattern
- Backup data with Core Data
- Using an open source library


# Architecture 
Le projet respect l'architecture MVC. 

# Initialisation du projet 

Au lancement du projet lancer la commande pod install à la racine du projet.
Cette commande permet d'installer les dépendences : 
- Alamafire
- SwiftGen
- CoreData
- SwiftLint

## <b> SwiftGen </b>
Lors que des éléments sont ajoutés dans les fichiers "Colors" ou "Asserts" il est indispensable de lancer le script swiftGenGenerate.sh avce la commande <code>./swiftGenGenerate.sh </code>
Ce script va permettre de lancer la compilation du swiftGen et générer les documents Colors et Assets dans les fichiers générés. 

SwiftGen est utile afin de permettre d'assurer une conversion de mommage et une utilisation de ces variables générées de manière sécurisée. Cela évite les fautes de frappe. 

## <b> Alamafire </b>
Cela permet d'effectuer facilement des appels réseau.

## <b> SwiftLint </b>
Permet d'assurer un respect des règles de programmation

## <b> Core Data </b>
Permet d'
