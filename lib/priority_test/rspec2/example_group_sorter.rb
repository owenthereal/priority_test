module PriorityTest
  module RSpec2
    module ExampleGroupSorter
      def self.sort(example_group1, example_group2)
        sorted_elements1 = sorted_elements(example_group1)
        sorted_elements2 = sorted_elements(example_group2)

        sorted_elements1 <=> sorted_elements2
      end

      private

      def self.sorted_elements(example_group)
        descendant_examples(example_group).collect do |e|
          PriorityTest::Core::PrioritySortElement.new(e.full_description)
        end.sort
      end

      def self.descendant_examples(example_group)
        example_group.descendants.collect(&:filtered_examples).flatten
      end
    end
  end
end
