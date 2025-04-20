CREATE OR REPLACE FUNCTION lokrug (
    radius REAL
) RETURN REAL IS
    l REAL;
BEGIN
    l := 3.14 * radius * 2;
    RETURN ( l );
END;
/

CREATE OR REPLACE FUNCTION lokrug1 (
    radius REAL
) RETURN REAL IS
BEGIN
    RETURN ( 3.14 * radius * 2 );
END;