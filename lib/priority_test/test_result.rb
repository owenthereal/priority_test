module PriorityTest
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
  end
end
