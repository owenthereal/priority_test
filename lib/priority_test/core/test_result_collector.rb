module PriorityTest
  module Core
    class TestResultCollector
      attr_reader :test_result

      def initialize(test_result = TestResult.new)
        @test_result = test_result
        @service = Service.new(PriorityTest.gateway)
      end

      def test_passed(test)
        @test_result.add_passed_test(test)
      end

      def test_failed(test)
        @test_result.add_failed_test(test)
      end

      def finish
        PriorityTest.service.save(@test_result)
      end
    end
  end
end
