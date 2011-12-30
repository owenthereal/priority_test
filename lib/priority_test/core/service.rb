module PriorityTest
  module Core
    class Service
      def initialize(gateway)
        @gateway = gateway
        @gateway.setup
      end

      def save(test_result)
        @gateway.bulk_create(test_result.tests)
      end
    end
  end
end
