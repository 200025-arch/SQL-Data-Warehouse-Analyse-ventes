
USE SalesTrack;
GO

--Vue Client
CREATE OR ALTER VIEW gold.dim_client AS (
	SELECT 
		ROW_NUMBER() OVER(ORDER BY customer_id) as customer_key,
		customer_id,
		company_name AS customer_name
	FROM silver.client
);
GO


--Vue produit

CREATE OR ALTER VIEW gold.dim_product AS (
	SELECT
		ROW_NUMBER() OVER(ORDER BY product_id) as product_key,
		product_id,
		product_name
	FROM silver.produit
);
GO


--Vue région

CREATE OR ALTER VIEW gold.dim_region AS (
	SELECT
		ROW_NUMBER() OVER(ORDER BY region_id) as region_key,
		region_id,
		region_name
	FROM silver.region
);
GO

--Vue catégorie

CREATE OR ALTER VIEW gold.dim_category AS (
	SELECT
		ROW_NUMBER() OVER(ORDER BY category) as category_key,
		category as category_name
	FROM silver.category
);
GO


--Vue des ventes
CREATE OR ALTER VIEW gold.fact_ventes AS (
	SELECT
		sv.order_id,
		gl.customer_key,
		gp.product_key,
		gc.category_key,
		gr.region_key,
		sv.orderdate,
		sv.quantity,
		sv.unit_price,
		sv.total_price,
		sv.orderstatus
	FROM silver.ventes as sv
	LEFT JOIN gold.dim_client as gl ON gl.customer_id = sv.customer_id
	LEFT JOIN gold.dim_product as gp ON gp.product_id = sv.product_id
	LEFT JOIN gold.dim_category as gc ON gc.category_name = sv.category
	LEFT JOIN gold.dim_region as gr ON gr.region_id = sv.region_id
);
GO

