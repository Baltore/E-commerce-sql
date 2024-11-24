# Projet E-Commerce SQL

## Description

Ce projet consiste à créer une base de données pour un site de commerce en ligne, avec plusieurs tables représentant les informations des utilisateurs, produits, commandes, factures, évaluations, et autres éléments clés d'un système de e-commerce.

Le projet inclut également des scripts PHP pour remplir ces tables avec des données fictives générées via la bibliothèque **Faker**.

## Structure de la base de données

La base de données contient les tables suivantes :

- **utilisateur** : Informations des utilisateurs
- **adresse** : Adresses des utilisateurs
- **produit** : Produits en vente
- **commande** : Commandes des utilisateurs
- **commande_article** : Détails des articles dans une commande (table de jointure)
- **facture** : Historique des factures
- **évaluation** : Évaluations des produits par les utilisateurs
- **moyen_de_paiement** : Informations sur les méthodes de paiement des utilisateurs
- **panier_article** : Articles dans le panier (table de jointure)

## Installation et Pré-requis

1. **PHP** : Assurez-vous que PHP est installé sur votre système.
2. **Composer** : Installez [Composer](https://getcomposer.org/) pour gérer les dépendances PHP (si vous ne l'avez pas déjà installé).
3. **Base de données** : Importez le fichier SQL pour créer la base de données dans PhpMyAdmin ou via la ligne de commande.

## Scripts PHP et Données Fictives

Des scripts PHP sont fournis pour remplir automatiquement les tables avec des données fictives en utilisant **Faker**.

Pour exécuter les scripts PHP, ouvrez votre terminal et utilisez la commande suivante dans le répertoire où se trouve votre fichier PHP :


````bash 
php votre_script.php
````

Cela remplira votre base de données avec des données fictives pour tester votre application e-commerce.

## Outils

- Faker pour la génération de données fictives.
- PHP pour sa plateforme de développement.
- MySQL pour la gestion de la base de données.
