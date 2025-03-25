SELECT grantee
      ,granted_role
FROM dba_role_privs
WHERE grantee = 'SCOTT';