set BACKUP_FILE=C:\Wrk\git\data-analytics\Bck\inec_20230617.bkp
SET PGPASSWORD=INECDBApp!5y5
cd C:\Program Files\PostgreSQL\15\bin
dropdb -h localhost -p 5432 -U inec m
createdb -h localhost -p 5432 -U inec -T template0 inec_bck_20230617
pg_restore -h localhost -p 5432 -U inec -d inec_bck_20230617 -v "%BACKUP_FILE%"
pause