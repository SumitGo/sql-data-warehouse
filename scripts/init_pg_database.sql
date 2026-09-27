/*Postgres
==========================================================
Create Databases and Schemas
==========================================================
Running Environment: 
  This script is intended to be run in `psql`. 
  If you intend to run it in gui tools like pgAdmin or something else, 
  then create a separate script for creating the database, 
  and then switching to the newly created database using the gui. 
  Once connected to the new database, run the commands after this statement - `\c firstdatawarehouse`.


Script Purpose:
  This script creates a new database name `firstdatawarehouse` after checking if it already exists.
  If the database already exists, then it is dropped and recreated. Additionally, this sets up three schemas 
  in the database - `bronze`, `silver`, `gold`.


WARNING:
  This script deletes the whole `firstdatawarehouse` database if it exists.
  All data will be permanantly deleted. Make sure to keep the backup 
  before running this script, and proceed with caution.

*/

```sql
-- dropping table if it exists
DROP DATABASE IF EXISTS firstdatawarehouse;

-- create fresh database
CREATE DATABASE firstdatawarehouse;

-- connect to the firstdatawarehouse database
\c firstdatawarehouse

-- create schemas in the firstdatawarehouse
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;
```
