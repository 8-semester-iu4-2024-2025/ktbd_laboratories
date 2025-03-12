-- DROP TABLE DOCTORS;
PROMPT Создание таблицы DOCTORS
CREATE TABLE doctors (
    dc_nnn            NUMBER(12,0),
    dc_dc_nnn         NUMBER(12,0),
    dc_name           VARCHAR2(255),
    dc_cs_nnn         NUMBER(12,0),
    dc_diploma_number NUMBER(12,0),
    dc_speciality_nnn NUMBER(12,0),
    dc_shat_nnn       NUMBER(12,0),
    dc_calendar       NUMBER(12,0)
)
TABLESPACE users;

-- DROP TABLE USERS;
PROMPT Создание таблицы USERS
CREATE TABLE users (
    us_id        NUMBER(12,0) UNIQUE NOT NULL,
    us_name      VARCHAR(255) NOT NULL,
    us_telephone NUMBER(11,0) UNIQUE NOT NULL
)
TABLESPACE users;

-- DROP TABLE DOCS;
PROMPT Создание таблицы DOCS
CREATE TABLE docs (
    doc_id    NUMBER(12,0) UNIQUE NOT NULL,
    doc_us_id NUMBER(12,0) NOT NULL,
    doc_name  VARCHAR(255) UNIQUE NOT NULL
)
TABLESPACE users;
