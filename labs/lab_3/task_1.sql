CREATE TABLE components (
    comp_cost INTEGER NULL
    ,comp_qua  INTEGER NULL
    ,comp_type VARCHAR(20) NULL
    ,comp_name VARCHAR(20) NOT NULL
    ,comp_id   INTEGER NOT NULL
);	-- Создание таблицы components
CREATE TABLE defect (
    dfct_date DATE NULL
    ,dfct_type VARCHAR(20) NULL
    ,dfct_desc VARCHAR(200) NULL
    ,dfct_name VARCHAR(20) NOT NULL
    ,dfct_id   INTEGER NOT NULL
);	-- Создание таблицы defect
CREATE TABLE documentation (
    docs_auth VARCHAR(20) NULL
    ,docs_date DATE NULL
    ,docs_type VARCHAR(20) NULL
    ,docs_name VARCHAR(20) NOT NULL
    ,docs_id   INTEGER NOT NULL
);	-- Создание таблицы documentation
CREATE TABLE equipment (
    eqpt_check DATE NULL
    ,eqpt_date  DATE NULL
    ,eqpt_type  VARCHAR(20) NULL
    ,eqpt_name  VARCHAR(20) NULL
    ,eqpt_id    INTEGER NOT NULL
);	-- Создание таблицы equipment
CREATE TABLE employees (
    empl_num  INTEGER NULL
    ,empl_job  VARCHAR(20) NULL
    ,empl_secn VARCHAR(20) NOT NULL
    ,empl_surn VARCHAR(20) NOT NULL
    ,empl_name VARCHAR(20) NOT NULL
    ,empl_id   INTEGER NOT NULL
);	-- Создание таблицы employees
CREATE TABLE failure (
    fail_dfct_id INTEGER NULL
    ,fail_res     VARCHAR(20) NOT NULL
    ,fail_date    DATE NULL
    ,fail_type    VARCHAR(20) NULL
    ,fail_prds_id INTEGER NOT NULL
    ,fail_id      INTEGER NOT NULL
);	-- Создание таблицы failure
CREATE TABLE products (
    prds_stat    VARCHAR(20) NOT NULL
    ,prds_id      INTEGER NOT NULL
    ,prds_date    DATE NOT NULL
    ,prds_dfct_id INTEGER NOT NULL
    ,prds_eqpt_id INTEGER NOT NULL
    ,prds_docs_id INTEGER NOT NULL
    ,prds_empl_id INTEGER NOT NULL
);	-- Создание таблицы products
CREATE UNIQUE INDEX unq_components_id ON
    components (
        comp_id
    );
ALTER TABLE components ADD (
    CONSTRAINT i_components_pk PRIMARY KEY ( comp_id )
);	-- Создание первичного ключа для таблицы components

ALTER TABLE products
       ADD  ( CONSTRAINT XPKproducts PRIMARY KEY (prds_id) ) ;	-- Создание первичного ключа для таблицы products
ALTER TABLE defect
       ADD  ( CONSTRAINT c_fail_id
              FOSREIGN KEY (fail_id)
                             REFERENCES failure ) ;	        --Добавление внешнего ключа в таблицу defect соединяющего ее с failure
ALTER TABLE defect
       ADD  ( CONSTRAINT c_comp_fk
              FOREIGN KEY (comp_id)
                             REFERENCES components 
            ) ;                                         	-- Добавление внешнего ключа в таблицу defect соединяющего ее с components
ALTER TABLE products
       ADD  ( CONSTRAINT c_empl_id
              FOREIGN KEY (prds_empl_id)
                             REFERENCES employees ) ;	    -- Добавление внешнего ключа в таблицу products соединяющего ее с employees
ALTER TABLE products
       ADD  ( CONSTRAINT c_docs_id
              FOREIGN KEY (prds_docs_id)
                             REFERENCES documentation ) ;	-- Добавление внешнего ключа в таблицу products соединяющего ее с documentation
 ALTER TABLE products
       ADD  ( CONSTRAINT c_eqpt_id
              FOREIGN KEY (prds_eqpt_id)
                             REFERENCES equipment ) ;	-- Добавление внешнего ключа в таблицу products соединяющего ее с equipment
ALTER TABLE products
       ADD  ( CONSTRAINT c_dftc_id
              FOREIGN KEY (prds_dfct_id)
                             REFERENCES defect ) ;	-- Добавление внешнего ключа в таблицу products соединяющего ее с defect
ALTER TABLE products
ADD CONSTRAINT с_products_ch 
CHECK (prds_date >= TO_DATE('01-JAN-2000', 'DD-MON-YYYY'));
CREATE TABLE standarts
AS (SELECT * from documentation WHERE docs_type='standart');
-- DROP TABLE defect CASCADE CONSTRAINTS;
COMMENT ON TABLE defect IS "Это таблица дефектов";

RENAME documentation to docs;
TRUNCATE TABLE docs;

CREATE SEQUENCE s_documentation
START WITH 100            
INCREMENT BY 2;

CREATE UNIQUE INDEX i_documentation_id 
ON documentation (documentation_id);
DROP INDEX i_documentation_id;

EXPLAIN PLAN FOR  SELECT * FROM documentation;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- Создаем точку сохранения
SAVEPOINT after_insert;
-- ....

ROLLBACK TO SAVEPOINT after_insert;

-- CREATE UNIQUE INDEX XPKdefect ON defect
-- (
--        dfct_id                        
-- );S
-- ALTER TABLE defect
--        ADD  ( CONSTRAINT XPKdefect PRIMARY KEY (dfct_id) ) ;	-- Создание первичного ключа для таблицы defect

-- CREATE UNIQUE INDEX XPK documentation ON documentation
-- (
--        docs_id                        
-- );
-- ALTER TABLE documentation
--        ADD  ( CONSTRAINT XPKdocumentation PRIMARY KEY (docs_id) ) ;	-- Создание первичного ключа для таблицы documentation

-- CREATE UNIQUE INDEX XPKemployees ON employees
-- (
--        empl_id                        
-- );
-- ALTER TABLE employees
--        ADD  ( CONSTRAINT XPKemployees PRIMARY KEY (empl_id) ) ;	-- Создание первичного ключа для таблицы employees
-- CREATE UNIQUE INDEX XPKequipment ON equipment
-- (
--        eqpt_id                        
-- );
-- ALTER TABLE equipment
--        ADD  ( CONSTRAINT XPKequipment PRIMARY KEY (eqpt_id) ) ;	-- Создание первичного ключа для таблицы equipment

-- CREATE UNIQUE INDEX XPKfailure ON failure
-- (
--        fail_id                        
-- );
-- ALTER TABLE failure
--        ADD  ( CONSTRAINT XPKfailure PRIMARY KEY (fail_id) ) ;	-- Создание первичного ключа для таблицы failure

-- CREATE UNIQUE INDEX XPKproducts ON products
-- (
--        prds_id                        
-- );
