PROMPT  Создаем БД CLINICS; 
SPOOL clinic.log;
CONNECT internal;

STARTUP NOMOUNT pfile=initclinic.ora;

CREATE DATABASE "clinics"
    MAXINSTANCES 1
    MAXLOGFILES 10
    CHARACTER SET "RU8PC866"
    NATIONAL CHARACTER SET "RU8PC866"
    DATAFILE '/oracle/db/system01.dbf' SIZE 100M
    LOGFILE
        '/oracle/db/lo  g01.dbf' SIZE 1M,
            '/oracle/db/log02.dbf' SIZE 1M;

disconnect;
SPOOL OFF;