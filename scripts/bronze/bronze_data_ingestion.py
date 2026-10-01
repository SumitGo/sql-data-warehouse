import psycopg2 as pg
from psycopg2 import sql
import time

"""
Data ingestion in Bronze layer
Purpose of this script: Perform Full Load
    truncate the table in the schema bronze.
    load the data in the table
    check if full load happened well, use count method to get the number of rows in the table we have inserted the data.
    measure the time it took to truncate and load the data
    measure the time it took to ingest data in the whole bronze layer.
"""

conn = pg.connect("dbname=firstdatawarehouse user=sumit")

tables = ('crm_cust_info', 'crm_prd_info', 'crm_sales_details', 'erp_cust_az12', 'erp_loc_a101', 'erp_px_cat_g1v2')

base_addr = "/home/sumit/Documents/DataWithBaraaSQL/data_warehouse_from_scratch/sql-data-warehouse-project/datasets/"
crm_addr = base_addr + 'source_crm/'
erp_addr = base_addr + 'source_erp/'

file_names = (crm_addr+'cust_info.csv', crm_addr+'prd_info.csv', crm_addr+ 'sales_details.csv', erp_addr+'CUST_AZ12.csv', erp_addr+'LOC_A101.csv', erp_addr+'PX_CAT_G1V2.csv')

count_rows= []

print("======================================")
print("Starting Full Load")
print("======================================")
full_load_start_time = time.time()
with conn.cursor() as cur:

    for table, file_name in zip(tables, file_names):
        print()
        print("----------------------------------")
        trunct_start_time = time.time()
        print(f"Truncating the table : bronze.{table}")
        cur.execute(sql.SQL("TRUNCATE bronze.{};").format(sql.Identifier(table)))
        trunct_end_time = time.time()
        print(f"Time taken: {trunct_end_time - trunct_start_time} seconds")
        print("----------------------------------")

        print(f"Loading Data into the Table: bronze.{table}")
        with open(file_name, 'r') as f:
            load_start_time = time.time()
            query = sql.SQL('''
                        COPY {}.{}
                        FROM STDIN
                        WITH (
                            HEADER true,
                            DELIMITER ',',
                            FORMAT csv
                        );
                    ''').format(sql.Identifier('bronze'),
                               sql.Identifier(table))
            cur.copy_expert(query, f)
            load_end_time = time.time()
        print("Loading Complete!!!")
        print(f"Time taken to load the table:{load_end_time - load_start_time} seconds")
        print("----------------------------------")
        cur.execute(sql.SQL('SELECT COUNT(*) FROM {}.{};').format(  sql.Identifier('bronze'),
                                                                    sql.Identifier(table)))
        count = cur.fetchone()
        print(f"Number of rows inserted: {count}")
        print()
        count_rows.append(count)
        conn.commit()
full_load_end_time = time.time()
print("======================================")
print("Full Load Completed")
print(f"Time Taken for Full Load: {full_load_end_time - full_load_start_time : 0.02f} seconds")
print("======================================")

print(count_rows)
