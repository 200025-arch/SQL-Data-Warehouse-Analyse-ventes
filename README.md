# SQL-Data-Warehouse-Analyse-ventes
Ce projet consiste à concevoir et implémenter un Data Warehouse de ventes en SQL Server, en suivant une architecture Medallion (Bronze / Silver / Gold).

Bienvenue dans le dépôt du projet SQL Data Warehouse Analyses Ventes ! 🚀 L’objectif est de transformer des données de ventes brutes (CSV) en données structurées, nettoyées et prêtes pour l’analyse, afin de faciliter la création de tableaux de bord et d’analyses business.

----
## Architechite DATA

<img width="1317" height="650" alt="Image" src="https://github.com/user-attachments/assets/287027a1-9de3-4793-9da4-6a3fca493c8f" />

### 🥉 Bronze – Raw layer

** Ingestion des données CSV sans transformation

**Chargement via BULK INSERT

**Rechargement complet (TRUNCATE + INSERT)

**Objectif : conserver la donnée source intacte
