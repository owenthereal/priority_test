module PriorityTest
  module Core
    class Service
      def initialize(all_tests)
        @all_tests = all_tests
      end

      def priority_test?(identifier)
        test = @all_tests.get_test(identifier)
        test.nil? ? true : test.priority?
      end
    end
  end
end
