-- Exercise 3 – PostgreSQL DDL for business_units and kpis

CREATE TABLE business_units (
    id          SERIAL        PRIMARY KEY,
    name        VARCHAR(100)  NOT NULL,
    department  VARCHAR(100),
    "timestamp" TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE kpis (
    id                  SERIAL         PRIMARY KEY,
    bu_id               INTEGER        NOT NULL,
    year_month          CHAR(7)        NOT NULL,  -- format YYYY-MM
    reporting_date      DATE,
    revenue             NUMERIC(15,2),
    cogs                NUMERIC(15,2),
    opex                NUMERIC(15,2),
    other_expenses      NUMERIC(15,2),
    d_a                 NUMERIC(15,2),
    patent_applications INTEGER,
    patent_filings      INTEGER,
    "timestamp"         TIMESTAMP      DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_kpis_business_unit
        FOREIGN KEY (bu_id) REFERENCES business_units (id)
);
