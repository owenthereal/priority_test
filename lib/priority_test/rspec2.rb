require 'rspec/core'

module PriorityTest
  module RSpec2
    autoload :ExampleToTestResultParser, 'priority_test/rspec2/example_to_test_result_parser'
    autoload :Formatter, 'priority_test/rspec2/formatter'

    def self.setup
      ::RSpec.configure do |config|
        config.formatters << formatter
        exclusion_filter = priority_set_filter
      end
    end

    def self.formatter
      Formatter.new(PriorityTest::Core::TestResultCollector.new)
    end

    def self.priority_set_filter
      lambda { |k, v|
        PriorityTest::RSpec2.priority_set.has_indentifier?(v[:location])
      }
    end
  end
end
