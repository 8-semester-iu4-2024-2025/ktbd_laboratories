SELECT user
      ,userenv('SESSIONID')
  FROM dual;