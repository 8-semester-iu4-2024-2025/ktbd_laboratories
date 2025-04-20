DECLARE
    pi     CONSTANT REAL := 3.141519265359;
    lokr   REAL;
    skrg   REAL;
    radius REAL := &radius;
BEGIN
    lokr := pi * radius * 2.0;
    skrg := pi * power(
        radius
       ,2
    );
    dbms_output.put_line('Радиус = '
                         || to_char(radius)
                         || ', ДЛИНА ОКРУЖНОСТИ ='
                         || to_char(lokr)
                         || ', ПЛОЩАДЬ КРУГА ='
                         || to_char(skrg));
END;
/

-- & - команда запроса ввода значения с клавиатуры