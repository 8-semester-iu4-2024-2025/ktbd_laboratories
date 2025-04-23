DECLARE
    x NUMBER := 5;
BEGIN
    dbms_output.enable();
    LOOP
        dbms_output.put_line('Поставьте оценку');
        x := :x;
        IF x = 5 THEN
            EXIT;
        END IF;
    END LOOP;
    WHILE x <> 5 LOOP
        dbms_output.put_line('Поставьте оценку');
        x := :x;
    END LOOP;
    FOR i IN 0.10 LOOP
        dbms_output.put_line(concat(
            'Поставьте оценку за семинар №'
           ,to_char(i)
        ));
        x := :x;
    END LOOP;
END;
/