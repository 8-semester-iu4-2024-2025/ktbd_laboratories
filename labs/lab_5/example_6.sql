-- Prompt Обработка исключительных ситуаций
-- DECLARE
--     x REAL := &x;
--     n INTEGER := 0;
-- BEGIN
--     dbms_output.enable();
--     dbms_output.put_line('Значения функции');
--     dbms_output.put_line('abs(x)=' || to_char(abs(x)));
--     n := n + 1;
--     dbms_output.put_line('ceil(x)=' || to_char(ceil(x)));
--     n := n + 1;
-- EXCEPTION
--     WHEN OTHERS THEN
--         BEGIN
--             dbms_output.put_line('ERRORS');
--             IF n = 0 THEN
--                 dbms_output.put_line('Ошибка в функции ABS(x)');
--             END IF;
--         END;
-- END;
-- /

DECLARE
    degree INTEGER := &degree;
BEGIN
    IF degree IN ( 1
                  ,2
                  ,3
                  ,4 ) THEN
        RAISE invalid_number;
    END IF;
EXCEPTION
    WHEN invalid_number THEN
        dbms_output.put_line('оценка слишком мала');
        ROLLBACK;
END;
/