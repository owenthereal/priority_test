module PriorityTest
  class TestResultService
    def initialize(adapter)
      @adapter = adapter
    end

    def bulk_create(tests)
      @adapter.bulk_create(tests)
    end
  end
end
