module PriorityTest
  module Core
    class TestResultCollector
      attr_reader :results

      def initialize
        @results = []
      end

      def add(test_result)
        @results << test_result
      end

      def passed_tests
        results.find_all { |result| result.passed? }
      end

      def failed_tests
        results.find_all { |result| result.failed? }
      end

      def finish
        PriorityTest.service.save(@test_suite_result)
      end
    end
  end
end
