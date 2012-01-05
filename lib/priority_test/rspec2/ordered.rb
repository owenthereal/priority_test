module PriorityTest
  module RSpec2
    # TODO Implement a SortedArray
    module Ordered
      def filtered_examples
        filtered_examples = super
        filtered_examples.sort! { |e1, e2| ExampleSorter.sort(e1, e2) }
      end

      def children
        children = super
        children.sort! { |eg1, eg2| ExampleGroupSorter.sort(eg1, eg2) }
      end
    end
  end
end
