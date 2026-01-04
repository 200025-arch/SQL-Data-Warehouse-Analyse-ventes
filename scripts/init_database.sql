
USE master; -- On bascule sur master pour créer une autre DB

/* SELECT * FROM sys.databases; -- On regarde les différentes DB qui existent */

/* On Drop la DB si elle existe */

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'SalesTrack') -- On check si la DB existe (Existe = 1 | Absente = '')
BEGIN
	--SET SINGLE_USER : met la DB en mode utilisateur unique (moi) dans le cas où d'autres user soient dessus (peu refuser de drop la DB dans ce cas)
	--LE ROLLBACK IMEDIATE : Coupe toutes les connexions active immédiatement et annule toutes les transactions en cours, sans délai

	ALTER DATABASE SalesTrack SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE SalesTrack; -- On Drop la DB
END;
GO  --Pour indiquer que ce qui est au-dessus doit être exécuté en un bloc unique, ensuite on repart sur un autre bloc

/* Création et utilisation de la base de donnée 'SalesTrack' */
CREATE DATABASE SalesTrack;
GO

USE SalesTrack;
GO

/* Création des SCHEMA */

CREATE SCHEMA bronze; 
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO


