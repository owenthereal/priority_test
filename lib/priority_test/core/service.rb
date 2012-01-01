module PriorityTest
  module Core
    class Service
      def initialize(gateway)
        @gateway = gateway
      end

      def save(test_suite_result)
        test_results = test_suite_result.all
        @gateway.bulk_create_test_results(test_results)
      end

      def load_all_tests_in_priority_order
        @gateway.dataset.group(:identifier).order(:status, :run_time).collect { |entry| TestResult.new(entry.to_hash) }
      end
    end
  end
end
