require 'rails/generators'
require 'rails/generators/migration'
require 'rails/generators/active_record/migration'

module CargoWiki
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      extend ActiveRecord::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)

      desc 'Copy (but does not run) the migrations of the engine.'
      def copy_migrations_files
        empty_directory "db/migrate"

        migration_template "create_cargo_wiki_articles.rb", "db/migrate/create_cargo_wiki_articles.rb"
        migration_template "create_cargo_wiki_users.rb", "db/migrate/create_cargo_wiki_users.rb"
        migration_template "add_author_id_to_articles.rb", "db/migrate/add_author_id_to_articles.rb"
        migration_template "add_auth_token_to_users.rb", "db/migrate/add_auth_token_to_users.rb"
        migration_template "add_role_to_users.rb", "db/migrate/add_role_to_users.rb"
        migration_template "create_versions.rb", "db/migrate/create_versions.rb"
        migration_template "add_commit_message_to_versions.rb", "db/migrate/add_commit_message_to_versions.rb"
        migration_template "acts_as_taggable_on_migration.rb", "db/migrate/acts_as_taggable_on_migration.rb"
        migration_template "add_published_to_cargo_wiki_articles.rb", "db/migrate/add_published_to_cargo_wiki_articles.rb"
      end
    end
  end
end
