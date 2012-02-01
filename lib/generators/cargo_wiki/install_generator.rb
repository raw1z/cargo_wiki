require 'rails/generators'

module CargoWiki
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc 'Copy (but does not run) the migrations of the engine.'
      def copy_migrations_files
        empty_directory "db/migrate"
        Dir.glob[File.expand_path('../../../../db/migrate/*.rb', __FILE__)] do |file|
          copy_file file, "db/migrate"
        end
      end
    end
  end
end
