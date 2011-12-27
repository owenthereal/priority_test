module PriorityTest
  module RSpec2
    class ExampleToTestParser
      attr_reader :example

      def initialize(example)
        @example = example
      end

      def to_test
        PriorityTest::Test.new(:identifier => relative_path(example.location),
                               :file_path => relative_path(example.file_path),
                               :status => example.execution_result[:status],
                               :started_at => example.execution_result[:started_at],
                               :run_time => example.execution_result[:run_time]
                              )
      end

      private

      def relative_path(line)
        RSpec::Core::Formatters::BaseFormatter::relative_path(line)
      end
    end
  end
end
