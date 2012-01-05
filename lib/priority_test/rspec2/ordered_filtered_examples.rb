module PriorityTest
  module RSpec2
    module OrderedFilteredExamples
      def filtered_examples
        filtered_examples = super
        filtered_examples.sort { |e1, e2| Sorter.sort(e1, e2) }
      end
    end
  end
end
