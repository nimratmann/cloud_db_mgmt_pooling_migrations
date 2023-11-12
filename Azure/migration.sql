CREATE TABLE alembic_version (
    version_num VARCHAR(32) NOT NULL, 
    CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num)
);

-- Running upgrade  -> d87c85c0c6d8

INSERT INTO alembic_version (version_num) VALUES ('d87c85c0c6d8');

-- Running upgrade d87c85c0c6d8 -> 8b4e3414a697

ALTER TABLE patients ADD COLUMN insurance VARCHAR(100) NOT NULL;

UPDATE alembic_version SET version_num='8b4e3414a697' WHERE alembic_version.version_num = 'd87c85c0c6d8';

