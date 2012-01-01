module PriorityTest
  module Core
    class TestSuiteResult
      attr_reader :passed_tests, :failed_tests

      def initialize
        @passed_tests = []
        @failed_tests = []
      end

      def add_passed_test(test)
        passed_tests << test
      end

      def add_failed_test(test)
        failed_tests << test
      end

      def all
        passed_tests + failed_tests
      end
    end
  end
end
