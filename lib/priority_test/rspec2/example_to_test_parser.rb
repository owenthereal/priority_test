require 'rspec/core/formatters/base_formatter'

module PriorityTest
  module RSpec2
    class ExampleToTestParser
      attr_reader :example

      def initialize(example)
        @example = example
      end

      def to_test
        PriorityTest::Core::Test.new(:identifier => relative_path(example.location),
                                     :file_path => relative_path(example.file_path),
                                     :status => example.execution_result[:status],
                                     :started_at => example.execution_result[:started_at],
                                     :run_time => example.execution_result[:run_time]
                                    )
      end

      private

      def relative_path(line)
        line = line.sub(File.expand_path("."), ".")
        line = line.sub(/\A([^:]+:\d+)$/, '\\1')
        return nil if line == '-e:1'
        line
      end
    end
  end
end
