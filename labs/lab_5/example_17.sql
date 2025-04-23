CREATE OR REPLACE PACKAGE calc IS
    FUNCTION square (
        radius IN REAL
    ) RETURN REAL;
    PROCEDURE length (
        radius IN REAL
       ,len    OUT VARCHAR
    );
END calc;
/
CREATE OR REPLACE PACKAGE BODY calc IS
    FUNCTION square (
        radius IN REAL
    ) RETURN REAL IS
    BEGIN
        RETURN ( 3.14 * radius ** 2 );
    END;
    PROCEDURE length (
        radius IN REAL
       ,len    OUT VARCHAR
    ) IS
    BEGIN
        len := 2 * 3.14 * radius;
        dbms_output.enable;
        dbms_output.put_line(len);
    END;

END calc;
/
DECLARE
    sqr REAL;
    len REAL;
    rad REAL := 1;
BEGIN
    sqr := calc.square(rad);
    calc.length(
        rad
       ,len
    );
    dbms_output.put_line('Square = ' || to_char(sqr));
    dbms_output.put_line('Length = ' || to_char(len));
END;
/