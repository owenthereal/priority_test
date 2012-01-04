module PriorityTest
  module Core
    class TestResultCollector
      attr_reader :all_tests

      def initialize(all_tests)
        @all_tests = all_tests
      end

      def add_result(test_result_hash)
        identifier = test_result_hash[:identifier]
        return unless identifier

        @all_tests.get_test(identifier) || @all_tests.add_test(test_params(test_result_hash))
        @all_tests.add_test_result(identifier, test_result_params(test_result_hash))
      end

      def finish
        # nothing
      end

      private

      def test_params(test_result_hash)
        {
          :identifier => test_result_hash[:identifier],
          :file_path => test_result_hash[:file_path]
        }
      end

      def test_result_params(test_result_hash)
        {
          :status => test_result_hash[:status],
          :started_at => test_result_hash[:started_at],
          :run_time => test_result_hash[:run_time]
        }
      end
    end
  end
end
