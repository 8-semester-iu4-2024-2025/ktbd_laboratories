DECLARE
    v_num1   NUMBER NULL := &num1;
    v_num2   NUMBER NULL := &num2;
    v_result VARCHAR(7);
BEGIN
    IF v_num1 IS NULL
    OR v_num2 IS NULL THEN
        v_result := 'error, v_num1 or v_num2 is null';
    ELSIF v_num1 >= v_num2 THEN
        v_result := 'no';
    ELSE
        v_result := 'yes';
    END IF;
END;
/