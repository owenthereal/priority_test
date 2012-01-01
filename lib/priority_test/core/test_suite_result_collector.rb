module PriorityTest
  module Core
    class TestSuiteResultCollector
      def initialize(test_suite_result = TestSuiteResult.new)
        @test_suite_result = test_suite_result
      end

      def test_passed(test_result)
        @test_suite_result.add_passed_test(test_result)
      end

      def test_failed(test_result)
        @test_suite_result.add_failed_test(test_result)
      end

      def finish
        PriorityTest.service.save(@test_suite_result)
      end
    end
  end
end
