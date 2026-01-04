USE SalesTrack;
GO

CREATE OR ALTER PROCEDURE bronze.load_bronze AS

BEGIN

	DECLARE @starttime DATETIME, @endtime DATETIME

	BEGIN TRY
		
		PRINT'===================================';
		PRINT'Chargement de la couche bronze';
		PRINT'===================================';



		--Insertion des données dans la table "sales_raw"

		SET @starttime = GETDATE();

		PRINT'>> Suppression des données de la Table : bronze.sales_raw';

		--On vide la table
		TRUNCATE TABLE bronze.sales_raw;

		PRINT'>> Chargement des données dans la Table : bronze.sales_raw';

		--Chragement en masse des données du fichier csv
		BULK INSERT bronze.sales_raw
		FROM 'C:\Users\mvoum\Desktop\Boot_camp\Power BI\2nd Formation\Dashboard\Ventes\sales_2.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ';',
			TABLOCK
		);

		SET @endtime = GETDATE();

		PRINT'>> Durée du chargement ' + CAST(DATEDIFF(second, @starttime, @endtime) AS NVARCHAR) + ' seconds';
		
		PRINT'===================================';
		PRINT'FIN';
		PRINT'===================================';

	END TRY

	BEGIN CATCH
		PRINT'===================================';
		PRINT'ERROR OCCURED DURING LOADING BRONZE LAYER';
		PRINT'ERROR MESSAGE' + CAST(ERROR_MESSAGE() AS NVARCHAR);
		PRINT'ERROR NUMBER' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT'ERROR STATE' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT'ERROR LINE' + CAST(ERROR_LINE() AS NVARCHAR);
		PRINT'ERROR PROCEDURE' + CAST(ERROR_PROCEDURE() AS NVARCHAR);
		PRINT'===================================';
	END CATCH
END;
GO

