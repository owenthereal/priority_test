module PriorityTest
  module Core
    class PrioritySortElement
      include Comparable

      attr_reader :test

      def initialize(identifier)
        @test = PriorityTest.all_tests.get_test(identifier)
      end

      def <=>(other)
        if test.nil? && !other.test.nil?
          1
        elsif !test.nil? && other.test.nil?
          -1
        elsif test && other.test
          test <=> other.test
        else
          0
        end
      end
    end
  end
end
