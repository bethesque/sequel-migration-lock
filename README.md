# Sequel Migration Lock

A spike codebase to recreate the scenario where two processes (eg AWS instances) are trying to migrate the same
database at the same time.

## Installation

    $ git clone git@github.com:bethesque/sequel-migration-lock.git
    $ cd sequel-migration-lock
    $ bundle

## Usage

* To create a race condition using the command line interface to MySQL

      $ ./test_cmd_line.sh

  This will fail with `Table 'foo' already exists`.

* To create a race condition using Sequel migrate to simulate the scenario where no schema_info table exists:

      $ ./test_ruby_with_no_schema_info.sh

  This will fail with `More than 1 row in migrator table (Sequel::Migrator::Error)`.

* To create a race condition using Sequel migrate to simulate the scenario where the schema_info table already exists:

      $ ./test_ruby_with_schema_info_already_created.sh.sh

  This will fail with `Mysql2::Error: Table 'foo' already exists (Sequel::DatabaseError)`.
