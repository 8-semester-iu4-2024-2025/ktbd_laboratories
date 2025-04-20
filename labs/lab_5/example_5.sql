DECLARE
    dt     DATE;
    radius REAL := &radius;
BEGIN
    dt := current_timestamp;
    FOR i IN 1..5 LOOP
        dbms_output.put_line(to_char(2 * 3.14 *(radius + i))
                             || ' время '
                             || to_char(
            (current_timestamp - dt)
           ,'SS'
        ));
    END LOOP;
END;
/