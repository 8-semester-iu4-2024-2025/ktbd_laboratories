CREATE OR REPLACE FUNCTION skrug (
    radius REAL
) RETURN REAL IS
    s REAL;
BEGIN
    s := 3.14 * ( radius * * 2 );
    RETURN ( s );
END;
/