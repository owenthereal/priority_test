module PriorityTest
  module RSpec2
    module Ordered
      def ordered
        sort { |example1, example2| Sorter.sort(example1, example2) }
      end
    end
  end
end
