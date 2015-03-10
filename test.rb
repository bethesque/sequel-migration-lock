require 'sequel'
require 'fileutils'
require 'logger'

FileUtils.mkdir_p 'log'
FileUtils.mkdir_p 'tmp'

logger = Logger.new('log/database.log')
connection = Sequel.connect(adapter: 'mysql2', database: 'sequel_migration_lock', logger: logger, username: 'test', password: 'test')
Sequel.extension :migration
Sequel::Migrator.run(connection, './migrations')
