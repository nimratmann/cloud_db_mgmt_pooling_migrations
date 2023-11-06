CREATE TABLE alembic_version (
    version_num VARCHAR(32) NOT NULL, 
    CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num)
);

-- Running upgrade  -> ab50bfbf4658

INSERT INTO alembic_version (version_num) VALUES ('ab50bfbf4658');

-- Running upgrade ab50bfbf4658 -> ce218e364886

ALTER TABLE patients ADD COLUMN is_alive VARCHAR(50) NOT NULL;

UPDATE alembic_version SET version_num='ce218e364886' WHERE alembic_version.version_num = 'ab50bfbf4658';
