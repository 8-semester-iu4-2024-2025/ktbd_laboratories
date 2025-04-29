SPOOL task_1.txt
INSERT INTO components (
    comp_cost
    ,comp_qua
    ,comp_type
    ,comp_name
    ,comp_id
) VALUES ( 100
          ,100
          ,'Транзистор'
          ,'2n2222'
          ,comp_id_seq.NEXTVAL );
INSERT INTO components (
    comp_cost
    ,comp_qua
    ,comp_type
    ,comp_name
    ,comp_id
) VALUES ( 1200
          ,10
          ,'Транзистор'
          ,'2n3904'
          ,comp_id_seq.NEXTVAL );
INSERT INTO components (
    comp_cost
    ,comp_qua
    ,comp_type
    ,comp_name
    ,comp_id
) VALUES ( 1200
          ,10
          ,'ОУ'
          ,'140УД1А'
          ,comp_id_seq.NEXTVAL );
COMMIT;
SPOOL OFF;