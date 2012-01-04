require 'rspec/core'

module PriorityTest
  module RSpec2
    autoload :RelativePath, 'priority_test/rspec2/relative_path'
    autoload :Formatter, 'priority_test/rspec2/formatter'

    def self.setup
      ::RSpec.configure do |config|
        config.formatters << formatter
        config.inclusion_filter = { :priority_test => filter }
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
