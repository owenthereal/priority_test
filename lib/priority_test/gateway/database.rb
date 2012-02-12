module PriorityTest
  module Gateway
    class Database
      def initialize(db)
        @db = db
        @table = @db[:results]
      end

      def setup
        @db.create_table? :results do
          primary_key :id

          String :identifier, :text => true, :null => false
          String :file_path, :text => true, :null => false
          String :status, :null => false
          DateTime :started_at, :null => false, :default => Time.now
          Numeric :run_time, :size => [10, 6], :null => false

          index :identifier
        end
      end

      def add_test(attributes = {})
        @table << attributes
      end

      def load_tests
        tests = []
        identifiers = @table.select(:identifier).distinct
        identifiers.each do |identifier|
          id = identifier[:identifier]

          test = Core::Test.new(:identifier => id)
          test_results_hash = @table.filter(:identifier => id).order(:started_at.desc).limit(5).all
          test_results_hash.each do |test_result_hash|
            test.add_result(test_result_hash)
          end

          tests << test
        end

        tests
      end
    end
  end
end
