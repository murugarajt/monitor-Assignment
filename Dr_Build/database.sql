-- SET DATABASENAME

--\set database db4


-- SET USERNAME
--\set username myuser4

-- SET PASSWORD
--\set password  'admin123'

SELECT 'CREATE DATABASE newDB'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'newDB')\gexec


DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_roles  -- SELECT list can be empty for this
      WHERE  rolname = 'myuser') THEN

      CREATE ROLE myuser LOGIN PASSWORD 'password';
   END IF;
END
$do$;


GRANT ALL PRIVILEGES ON DATABASE newDB TO myuser;