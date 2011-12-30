require 'sequel'

module PriorityTest
  module Gateways
    class Sequel
      def initialize(connection)
        @connection = connection
      end

      def setup
        @connection.create_table? :tests do
          primary_key :id
          String :identifier
          String :file_path
          String :status
          DateTime :started_at
          Numeric :run_time
        end
      end

      def teardown
        @connection.disconnect
      end

      def bulk_create(tests)
        dataset.multi_insert(tests.collect(&:to_hash))
      end

      def dataset
        @connection[:tests]
      end
    end
  end
end
