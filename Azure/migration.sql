CREATE TABLE alembic_version (
    version_num VARCHAR(32) NOT NULL, 
    CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num)
);

-- Running upgrade  -> b29827d7b2ae

INSERT INTO alembic_version (version_num) VALUES ('b29827d7b2ae');

-- Running upgrade b29827d7b2ae -> 07c3178e6064

ALTER TABLE patients ADD COLUMN is_alive VARCHAR(50) NOT NULL;

UPDATE alembic_version SET version_num='07c3178e6064' WHERE alembic_version.version_num = 'b29827d7b2ae';
