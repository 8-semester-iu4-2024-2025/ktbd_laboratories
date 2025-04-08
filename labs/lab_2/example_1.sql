PROMPT  Создаем БД CLINICS; 
SPOOL clinic.log;

connect system/oracle_password@localhost:1521 AS SYSDBA
STARTUP NOMOUNT
CREATE DATABASE "clinics123"
    MAXINSTANCES 1
    MAXLOGFILES 10
    CHARACTER SET "RU8PC866"
    NATIONAL CHARACTER SET "RU8PC866"
    DATAFILE '/opt/oracle/CLINICS1/system01.dbf' SIZE 100M
    LOGFILE
        '/opt/oracle/CLINICS1/log01.dbf' SIZE 1M
        ,'/opt/oracle/CLINICS1/log02.dbf' SIZE 1M;

SPOOL OFF;