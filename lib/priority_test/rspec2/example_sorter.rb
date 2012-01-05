module PriorityTest
  module RSpec2
    module ExampleSorter
      def self.sort(example1, example2)
        element1 = PriorityTest::Core::PrioritySortElement.new(example1.full_description)
        element2 = PriorityTest::Core::PrioritySortElement.new(example2.full_description)

        element1 <=> element2
      end
    end
  end
end
