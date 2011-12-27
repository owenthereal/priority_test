require 'rspec/core/formatters/base_formatter'

module PriorityTest
  module RSpec2
    class Formatter < RSpec::Core::Formatters::BaseFormatter
      def initialize(test_result)
        @test_result = test_result
        super
      end

      def example_passed(example)
        @test_result.test_passed(to_test(example))
      end

      def example_failed(example)

        @test_result.test_failed(to_test(example))
      end

      private

      def to_test(example)
        ExampleToTestParser.new(example).to_test
      end
    end
  end
end
