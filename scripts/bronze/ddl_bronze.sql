/*Postgres
============================================
Creating Table in Bronze Layer
============================================

Purpose of this script:
  This script creates 6 tables in the bronze layer of data warehouse.
  To redefine the tables, run this script again.

NOTE: This script drops the existing tables present in this script.

*/


-- drop the existing bronze.crm_prd_info table.
DROP TABLE IF EXISTS bronze.crm_prd_info;
-- Create the crm_prd_info table:
CREATE TABLE bronze.crm_prd_info(
  prd_id int,
  prd_key varchar(50),
  prd_nm varchar(50),
  prd_cost int,
  prd_line varchar(50),
  prd_start_dt date,
  prd_end_dt date
  );


-- drop the existing bronze.crm_sales_details table.
DROP TABLE IF EXISTS bronze.crm_sales_details;
-- Create the crm_sales_details table:
CREATE TABLE bronze.crm_sales_details(
  sls_ord_num varchar(50),
  sls_prd_key varchar(50),
  sls_cust_id int, 
  sls_order_dt int,
  sls_ship_dt int,
  sls_due_dt int,
  sls_sales int,
  sls_quantity int,
  sls_price int
  );


-- drop the existing bronze.crm_cust_info table.
DROP TABLE IF EXISTS bronze.crm_cust_info;
--creating the crm_cust_info table.
CREATE TABLE bronze.crm_cust_info(
  cst_id int,               
  cst_key varchar(50),
  cst_firstname varchar(50),
  cst_lastname varchar(50),
  cst_martial_status varchar(50),
  cst_gndr varchar(50),
  cst_create_date date
  );


-- drop the existing bronze.erp_cust_az12 table.
DROP TABLE IF EXISTS bronze.erp_cust_az12;
--create erp_cust_az12 table
CREATE TABLE bronze.erp_cust_az12(
  cid varchar(50),
  bdate date,
  gen varchar(50) 
  );


-- drop the existing bronze.erp_loc_a101 table.
DROP TABLE IF EXISTS bronze.erp_loc_a101;
--create erp_loc_a101 table
CREATE TABLE bronze.erp_loc_a101(
  cid varchar(50),
  cntry varchar(50)
  );


-- drop the existing bronze.erp_px_cat_g1v2 table.
DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;
--create erp_px_cat_g1v2 table
CREATE TABLE bronze.erp_px_cat_g1v2(
  id varchar(50),
  cat varchar(50),
  subcat varchar(50),
  maintenance varchar(50)
  );
		
