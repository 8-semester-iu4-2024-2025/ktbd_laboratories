SPOOL task_12.txt
SELECT ( instr(
    'MONTUEWEDTHUFRISATSUN'
   ,to_char(
        sysdate
       ,'DY'
       ,'NLS_DATE_LANGUAGE = AMERICAN'
    )
) + 2 ) / 3 "День от начала недели"
  FROM dual;
SPOOL OFF;