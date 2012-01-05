module PriorityTest
  module RSpec2
    module Sorter
      def self.sort(example1, example2)
        test1 = PriorityTest.all_tests.get_test(relative_path(example1))
        test2 = PriorityTest.all_tests.get_test(relative_path(example2))

        p test1
        p test2

        if test1.nil? && !test2.nil?
          1
        elsif !test1.nil? && test2.nil?
          -1
        else
          test1 <=> test2
        end
      end

      private

      def self.relative_path(example)
        RelativePath.convert(example.location)
      end
    end
  end
end
