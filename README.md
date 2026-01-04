# SQL-Data-Warehouse-Analyse-ventes
Ce projet consiste à concevoir et implémenter un Data Warehouse de ventes en SQL Server, en suivant une architecture Medallion (Bronze / Silver / Gold).

Bienvenue dans le dépôt du projet SQL Data Warehouse Analyses Ventes ! 🚀 L’objectif est de transformer des données de ventes brutes (CSV) en données structurées, nettoyées et prêtes pour l’analyse, afin de faciliter la création de tableaux de bord et d’analyses business.

----
## Architechite DATA

<img width="1317" height="650" alt="Image" src="https://github.com/user-attachments/assets/287027a1-9de3-4793-9da4-6a3fca493c8f" />

### 🥉 Bronze – Raw layer

* Ingestion des données CSV sans transformation

* Chargement via BULK INSERT

* Rechargement complet (TRUNCATE)

* Objectif : conserver la donnée source intacte

### 🥈 Silver – Cleansed & Modeled layer

* Nettoyage des données

* Normalisation (clients, produits, ventes)

* Gestion des types de données

* Suppression des incohérences

### 🥇 Gold – Analytical layer

* Ajout clés primaires

* Tables orientées analyse

* Agrégations business

* Prêtes pour Power BI / reporting

----
📖 Aperçu du projet

Ce projet comprend :

1.**Architecture des données :** Conception d’un entrepôt de données moderne en utilisant l’architecture Medallion avec les couches Bronze, Silver et Gold.

2.**Pipelines ETL :** Extraction, transformation et chargement des données depuis les systèmes sources vers l’entrepôt.

3.**Modélisation des données :** Développement de tables de faits et de dimensions optimisées pour les requêtes analytiques.

4.**Analytique & Reporting :** Création de rapports et tableaux de bord basés sur SQL pour fournir des insights exploitables.

-
## Flux de données

Le flux de données dans cette architecture représente le chemin que suivent les données depuis les systèmes sources jusqu’aux couches finales du modèle.

