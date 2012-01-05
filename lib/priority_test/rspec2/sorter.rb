module PriorityTest
  module RSpec2
    module Sorter
      def self.sort(example1, example2)
        test1 = PriorityTest.all_tests.get_test(example1.full_description)
        test2 = PriorityTest.all_tests.get_test(example2.full_description)

        if test1.nil? && !test2.nil?
          1
        elsif !test1.nil? && test2.nil?
          -1
        else
          test1 <=> test2
        end
      end
    end
  end
end
