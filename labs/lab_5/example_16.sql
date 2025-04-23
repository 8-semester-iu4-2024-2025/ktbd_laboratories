Prompt формируем отчет по всем объектам созд. за промежуток времени
CREATE OR REPLACE PROCEDURE krug_params (
    radius IN REAL
   ,s      OUT REAL
   ,l      OUT REAL
) IS
BEGIN
    s := 3.14 * ( radius * * 2 );
    s := 2 * 3.14 * radius;
END;

DECLARE 
