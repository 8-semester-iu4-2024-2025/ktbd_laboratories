CREATE ROLE "table_creater" NOT IDENTIFIED;
GRANT
    CREATE ANY TABLE
TO "table_creater";
GRANT "table_creater" TO "kruglovvs";