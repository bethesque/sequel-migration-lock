BEGIN;
SELECT * FROM `schema_info` LIMIT 1 FOR UPDATE;
create table foo (name varchar(255));
update schema_info set version = 1;
COMMIT;
