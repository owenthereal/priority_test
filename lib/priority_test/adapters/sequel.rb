require 'sequel'

module PriorityTest
  module Adapters
    class Sequel
      def initialize(db)
        @db = db
      end

      def setup
        @db.create_table :tests do
          primary_key :id
          String :identifier
          String :file_path
          String :status
          DateTime :started_at
          Numeric :run_time
        end
      end

      def bulk_create(tests)
        dataset.multi_insert(tests.collect(&:to_hash))
      end

      def dataset
        @db[:tests]
      end
    end
  end
end
