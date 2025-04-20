CREATE TABLE test1 (
    id   NUMBER
    ,data VARCHAR(255)
);

CREATE SEQUENCE test1_seq;

CREATE OR REPLACE TRIGGER test1_trig BEFORE
    INSERT ON test1
    FOR EACH ROW
BEGIN
    SELECT test1_seq.NEXTVAL
      INTO :new.id
      FROM dual;
END;

-- CREATE SEQUENCE test1_seq;
-- CREATE OR REPLACE TRIGGER tr_pay_telefon BEFORE
--     INSERT ON pay_telefon
--     FOR EACH ROW
-- BEGIN
--     SELECT s_pt_id.NEXTVAL
--       INTO :new.pt_id
--       FROM dual;
-- END;

/