/***************************************************************************/
/* CREATE: USER
   CREATE: DATABASE */
/***************************************************************************/
DROP DATABASE inec;
DROP USER inec;
CREATE USER inec WITH PASSWORD 'INECDBApp!5y5';
ALTER ROLE inec WITH SUPERUSER;
CREATE DATABASE inec WITH OWNER inec;
GRANT ALL PRIVILEGES ON DATABASE inec TO inec;
-- LIMITANDO A 500 USUARIOS
ALTER DATABASE inec CONNECTION LIMIT = 500;
COMMENT ON DATABASE inec IS 'INEC | Datos historicos';

