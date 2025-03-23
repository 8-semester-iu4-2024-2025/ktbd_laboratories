CREATE ROLE "manager" NOT IDENTIFIED;
GRANT
    CREATE TABLE
TO "manager";
GRANT "manager" TO "user";