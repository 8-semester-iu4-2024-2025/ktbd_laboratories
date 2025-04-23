DECLARE
    dt     DATE;
    radius REAL := &radius;
BEGIN
    dt := current_timestamp;
    LOOP
        radius := radius + 1;
        dbms_output.put_line(to_char(2 * 3.14 *(radius))
                             || ' время '
                             || to_char(
            (current_timestamp - dt)
           ,'SS'
        ));
        IF radius > 5 THEN
            EXIT;
        END IF;
    END LOOP;
END;
/