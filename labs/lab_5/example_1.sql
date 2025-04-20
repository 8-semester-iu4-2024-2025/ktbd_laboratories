   SET SERVEROUTPUT ON;
BEGIN
    dbms_output.enable();
    dbms_output.put_line('HELLO WORLD');
END;
/

-- dbms_output - пакет
-- dbms_output.enable - функция, содержащая в себе только SET SERVEROUTPUT ON
-- dbms_output.put_line('HELLO WORLD'); - функция, содержащая в себе только SET SERVEROUTPUT ON
-- / - команда RUN