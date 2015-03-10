mysql -h localhost -u root -e "DROP DATABASE IF EXISTS sequel_migration_lock"
mysql -h localhost -u root -e "CREATE DATABASE sequel_migration_lock"
mysql -h localhost -u root -e "CREATE TABLE sequel_migration_lock.schema_info(version integer NOT NULL DEFAULT 0)"
mysql -h localhost -u root -e "insert into sequel_migration_lock.schema_info (version) values (0)"
mysql -h localhost -u root -e "GRANT ALL PRIVILEGES ON sequel_migration_lock.* TO 'test'@'localhost' identified by 'test';"
rm -rf log/database.log
bundle exec ruby test.rb &
bundle exec ruby test.rb
