CREATE TABLE alembic_version (
    version_num VARCHAR(32) NOT NULL, 
    CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num)
);

-- Running upgrade  -> 39f4ebb9db99

ALTER TABLE medical_records ADD COLUMN record_id INTEGER NOT NULL;

ALTER TABLE medical_records DROP COLUMN id;

ALTER TABLE patients ADD COLUMN insurance VARCHAR(100) NOT NULL;

ALTER TABLE patients ADD COLUMN is_alive VARCHAR(50) NOT NULL;

ALTER TABLE patients MODIFY contact_number VARCHAR(100) NULL;

INSERT INTO alembic_version (version_num) VALUES ('39f4ebb9db99');

