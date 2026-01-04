
USE SalesTrack;
GO

/* Création des tables de la couche silver */


--création de la table client

--Suppression de la table si elle existe
DROP TABLE IF EXISTS silver.client;
GO

CREATE TABLE silver.client(
customer_id NVARCHAR(50),
company_name NVARCHAR(60)
);

--Création de la table région

--Suppression de la table si elle existe
DROP TABLE IF EXISTS silver.region;
GO

CREATE TABLE silver.region(
region_id NVARCHAR(50),
region_name NVARCHAR(50)
);

--Création de la table produit

--Suppression de la table si elle existe
DROP TABLE IF EXISTS silver.produit;
GO

CREATE TABLE silver.produit(
product_id NVARCHAR(50),
product_name NVARCHAR(50)
);

--Création de la table catégorie

--Suppression de la table si elle existe
DROP TABLE IF EXISTS silver.category;
GO

CREATE TABLE silver.category(
category NVARCHAR(50)
);

--création de la table vente

DROP TABLE IF EXISTS silver.ventes;
GO

CREATE TABLE silver.ventes(
order_id NVARCHAR(50),
customer_id NVARCHAR(50),
product_id NVARCHAR(50),
category NVARCHAR(50),
region_id NVARCHAR(50),
orderdate DATE,
quantity INT,
unit_price INT,
total_price INT,
orderstatus NVARCHAR(50)
);
GO


