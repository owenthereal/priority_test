module PriorityTest
  module Core
    class AllTests
      def initialize(tests=[])
        @test_hash = Hash[tests.collect { |t| [t.identifier, t] }]
      end

      def add_test(test_params)
        test = Test.create(test_params)
        @test_hash[test.identifier] = test
      end

      def get_test(identifier)
        @test_hash[identifier]
      end

      def add_test_result(identifier, test_result_params)
        test = get_test(identifier)
        if test
          test.add_result(test_result_params)
          test.update_statistics
        end
      end

      def size
        @test_hash.size
      end
    end
  end
end
