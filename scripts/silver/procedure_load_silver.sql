
USE SalesTrack;
GO

CREATE OR ALTER PROCEDURE silver.load_silver AS

BEGIN
	
	DECLARE @start_time DATETIME, @end_time DATETIME

	BEGIN TRY
		
		PRINT'===============================';
		PRINT'Chargement de la couche silver';
		PRINT'===============================';
		

		PRINT'>> Chargement de la table : silver.client';
		/* Table client */

		SET @start_time = GETDATE();
		PRINT'>>> Suppression des données de la Table : silver.client';
		--Vider la table avant de refaire un chargement pour éviter les doublons
		TRUNCATE TABLE silver.client

		PRINT'>> Chargement des données dans la Table : silver.client';
		--Insertion des données dans la table
		INSERT INTO silver.client (
		customer_id ,
		company_name
		)

		SELECT DISTINCT
			customer_id,
			company_name
		FROM bronze.sales_raw;

		SET @end_time = GETDATE();

		PRINT'>> Durée du chargement ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT'--------------------------';

		PRINT'>> Chargement de la table : silver.region';
		/* Table région */

		SET @start_time = GETDATE();
		PRINT'>>> Suppression des données de la Table : silver.region';
		--Vider la table region
		TRUNCATE TABLE silver.region

		PRINT'>> Chargement des données dans la Table : silver.region';
		--Insertion des données dans la table
		INSERT INTO silver.region(
		region_id,
		region_name
		)

		SELECT DISTINCT
			region_id,
			region_name
		FROM bronze.sales_raw
		ORDER BY region_id;

		SET @end_time = GETDATE();
		PRINT'>> Durée du chargement ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT'--------------------------';

		PRINT'>> Chargement de la table : silver.produit';
		/* Table produit */

		SET @start_time = GETDATE();
		PRINT'>>> Suppression des données de la Table : silver.produit';
		--Vider la table produit
		TRUNCATE TABLE silver.produit

		PRINT'>> Chargement des données dans la Table : silver.produit';
		--Insertion des données dans la table
		INSERT INTO silver.produit (
		product_id,
		product_name
		)

		SELECT DISTINCT
			product_id,
			ProductName
		FROM bronze.sales_raw;

		SET @end_time = GETDATE();
		PRINT'>> Durée du chargement ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT'--------------------------';

		PRINT'>> Chargement de la table : silver.category';
		/* Table category */

		SET @start_time = GETDATE();
		PRINT'>>> Suppression des données de la Table : silver.category';
		--Vider la table category
		TRUNCATE TABLE silver.category

		PRINT'>> Chargement des données dans la Table : silver.category';
		--Inserer les données dans la table
		INSERT INTO silver.category(
		category
		)

		SELECT DISTINCT
			category
		FROM bronze.sales_raw;

		SET @end_time = GETDATE();
		PRINT'>> Durée du chargement ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT'--------------------------';

		PRINT'>> Chargement de la table : silver.ventes';
		/* Table ventes */

		SET @start_time = GETDATE();
		PRINT'>>> Suppression des données de la Table : silver.ventes';
		--vider la table vente
		TRUNCATE TABLE silver.ventes

		PRINT'>> Chargement des données dans la Table : silver.vente';
		--Insérer les données dans la table vente
		INSERT INTO silver.ventes (
		order_id,
		customer_id,
		product_id,
		category,
		region_id,
		orderdate,
		quantity,
		unit_price,
		total_price,
		orderstatus
		)

		SELECT
			order_id,
			customer_id,
			product_id,
			category,
			region_id,
			orderdate,
			quantity,
			unit_price,
			total_price,
			orderstatus
		FROM bronze.sales_raw;

		SET @end_time = GETDATE();
		PRINT'>> Durée du chargement ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT'--------------------------';

	END TRY
		
	BEGIN CATCH
		PRINT'===================================';
		PRINT'ERROR OCCURED DURING LOADING BRONZE LAYER';
		PRINT'ERROR MESSAGE ' + CAST(ERROR_MESSAGE() AS NVARCHAR);
		PRINT'ERROR NUMBER ' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT'ERROR STATE ' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT'ERROR LINE ' + CAST(ERROR_LINE() AS NVARCHAR);
		PRINT'ERROR PROCEDURE ' + CAST(ERROR_PROCEDURE() AS NVARCHAR);
		PRINT'===================================';
	END CATCH

END;
GO
