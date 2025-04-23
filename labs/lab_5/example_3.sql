DECLARE
    v_num1   NUMBER;
    v_num2   NUMBER;
    v_result VARCHAR(32);
BEGIN
    IF v_num1 IS NULL
    OR v_num2 IS NULL THEN
        v_result := 'error, v_num1 or v_num2 is null';
    ELSIF v_num1 >= v_num2 THEN
        v_result := 'no';
    ELSE
        v_result := 'yes';
    END IF;
    dbms_output.put_line(to_char(v_result));
END;
/