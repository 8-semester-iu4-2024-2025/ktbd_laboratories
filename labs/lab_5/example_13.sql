SELECT to_char(
    extract(YEAR FROM current_date)
   ,'FMRM'
) roman_year
  FROM dual;