module PriorityTest
  module Core
    class TestResult
      attr_reader :passed_tests, :failed_tests

      def initialize
        @passed_tests = []
        @failed_tests = []
      end

      def test_passed(test)
        passed_tests << test
      end

      def test_failed(test)
        failed_tests << test
      end

      def tests
        passed_tests + failed_tests
      end

      def finish
        PriorityTest.service.save(self)
      end
    end
  end
end
