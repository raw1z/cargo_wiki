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

        migrations_folder = File.expand_path("../../../../db/migrate", __FILE__)
        Dir["#{migrations_folder}/*.rb"].each do |file|
          filename = File.basename(file)
          copy_file file, "db/migrate/#{filename}"
        end
      end
    end
  end
end
