require 'sequel'

module PriorityTest
  module Gateway
    class Sequel
      class << self
        attr_reader :database
      end

      def self.setup
        @database ||= ::Sequel.connect(PriorityTest.config[:database])
        run_migration(database)
      end

      def self.teardown
        @database.disconnect if @database
        @database = nil
      end

      def self.run_migration(database)
        database.create_table? :tests do
          primary_key :id
          String :identifier
          String :file_path
          Integer :priority, :default => 1024
        end

        database.create_table? :test_results do
          primary_key :id
          String :status
          DateTime :started_at
          Numeric :run_time
          foreign_key :test_id, :tests
          index :test_id
        end
      end

      # def bulk_create_test_results(test_results)
      #   dataset.multi_insert(test_results.collect(&:to_hash))
      # end

      # def dataset
      #   database[:test_results]
      # end
    end
  end
end
