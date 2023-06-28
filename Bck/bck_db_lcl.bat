@echo off 
for /F "tokens=1,2,3 delims=-" %%i IN ('date /t') do ( 
echo %%i
echo %%j
echo %%k
set datestr=%%i%%j%%k
)
echo "Borrar espacios en blanco del archivo"
set datestr=%datestr: =%
echo datestr is %datestr%
set BACKUP_FILE=C:\Wrk\git\data-analytics\Bck\inec_%datestr%.bkp
SET PGPASSWORD=INECDBApp!5y5
echo on
cd C:\Program Files\PostgreSQL\15\bin
pg_dump -h localhost -p 5432 -U inec -F c -b -v -f "%BACKUP_FILE%" inec
pause