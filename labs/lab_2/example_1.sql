PROMPT  Создаем БД CLINICS; 
SPOOL clinic.log;

CREATE DATABASE "clinics"
    MAXINSTANCES 1
    MAXLOGFILES 10
    CHARACTER SET "RU8PC866"
    NATIONAL CHARACTER SET "RU8PC866"
    DATAFILE '/opt/oracle/oradata/CLINICS/system01.dbf' SIZE 100M
    LOGFILE
        '/opt/oracle/oradata/CLINICS/log01.dbf' SIZE 1M
        ,'/opt/oracle/oradata/CLINICS/log02.dbf' SIZE 1M;

SPOOL OFF;