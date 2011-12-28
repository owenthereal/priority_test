module PriorityTest
  module Core
    class Service
      def initialize(adapter)
        @adapter = adapter
      end

      def save(test_result)
        @adapter.bulk_create(test_result.tests)
      end
    end
  end
end
