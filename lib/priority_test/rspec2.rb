require 'rspec/core'

module PriorityTest
  module RSpec2
    autoload :ExampleToTestParser, 'priority_test/rspec2/example_to_test_parser'
    autoload :Formatter, 'priority_test/rspec2/formatter'

    def self.setup
      ::RSpec.configure do |config|
        config.formatters << formatter
      end
    end

    def self.formatter
      Formatter.new(PriorityTest::Core::TestResultCollector.new)
    end
  end
end
