require 'sequel'
require 'sequel/extensions/migration'

module PriorityTest
  module Gateway
    class Sequel
      class << self
        attr_reader :database
      end

      def self.setup
        ::Sequel.database_timezone = :utc
        @database ||= ::Sequel.connect(PriorityTest.configuration.database)
        run_migration(database)
      end

      def self.teardown
        @database.disconnect if @database
        @database = nil
      end

      def self.run_migration(database)
        ::Sequel::Migrator.apply(database, migrations_dir)
      end

      private

      def self.migrations_dir
        File.join(File.expand_path(File.dirname(__FILE__)), 'migrations')
      end
    end
  end
end
