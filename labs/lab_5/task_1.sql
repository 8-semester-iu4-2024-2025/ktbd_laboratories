DECLARE
    monthes NUMBER;
    days    NUMBER;
    hours   NUMBER;
    now     DATE := :now;
    sessia  DATE := :sessia;
BEGIN
    dbms_output.put_line('До начала сессии '
                         || to_char(floor(months_between(
        sessia
       ,now
    )))
                         || ' месяцев или '
                         || to_char(floor(sessia - now))
                         || ' дней или '
                         || to_char(floor((sessia - now) * 24))
                         || ' минут');
END;
/