require 'rspec/core'

module PriorityTest
  module RSpec2
    autoload :RelativePath, 'priority_test/rspec2/relative_path'
    autoload :Formatter, 'priority_test/rspec2/formatter'
    autoload :Sorter, 'priority_test/rspec2/sorter'
    autoload :OrderedFilteredExamples, 'priority_test/rspec2/ordered_filtered_examples'

    def self.setup
      ::RSpec.configure do |config|
        config.formatters << formatter
        config.run_all_when_everything_filtered = true
        config.inclusion_filter = { :priority_test => filter }
        config.extend OrderedFilteredExamples
      end
    end

    def self.formatter
      Formatter.new(PriorityTest.test_result_collector)
    end

    def self.filter
      lambda { |k, v|
        PriorityTest.service.priority_test?(RelativePath.convert(v[:location]))
      }
    end
  end
end
