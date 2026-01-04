
USE SalesTrack;
GO
/* Création de la table (Source ERP) */

-- Suppression de la table si elle existe

--1ere méthode pour drop

/*
IF OBJECT_ID('bronze.sales_raw', 'U') IS NOT NULL
	DROP TABLE bronze.sales_raw;
GO
*/


--2nd méthode pour drop (plus simple à lire)
DROP TABLE IF EXISTS bronze.sales_raw;
GO

--Création de la table
CREATE TABLE bronze.sales_raw(
order_id NVARCHAR(50),
customer_id NVARCHAR(50),
company_name NVARCHAR(60),
product_id NVARCHAR(50),
ProductName NVARCHAR(50),
category NVARCHAR(50),
region_id NVARCHAR(50),
region_name NVARCHAR(50),
orderdate DATE,
quantity INT,
unit_price INT,
total_price INT,
orderstatus NVARCHAR(50)
);
GO
