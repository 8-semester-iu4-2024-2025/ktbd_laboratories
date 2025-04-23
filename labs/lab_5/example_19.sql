ALTER TABLE defect ADD (
    CONSTRAINT c_comp_fk FOREIGN KEY ( comp_id )
        REFERENCES components
);

ALTER TABLE products ADD (
    CONSTRAINT c_empl_id FOREIGN KEY ( prds_empl_id )
        REFERENCES employees
);
ALTER TABLE products ADD (
    CONSTRAINT c_docs_id FOREIGN KEY ( prds_docs_id )
        REFERENCES documentation
);