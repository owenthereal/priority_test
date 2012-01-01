require 'sequel'

module PriorityTest
  module Gateways
    class Sequel
      def initialize(connection)
        @connection = connection
      end

      def setup
        @connection.create_table? :test_results do
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

      def bulk_create_test_results(test_results)
        dataset.multi_insert(test_results.collect(&:to_hash))
      end

      def dataset
        @connection[:test_results]
      end
    end
  end
end
