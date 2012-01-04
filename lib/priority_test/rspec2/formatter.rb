require 'rspec/core/formatters/base_formatter'

module PriorityTest
  module RSpec2
    class Formatter < RSpec::Core::Formatters::BaseFormatter
      def initialize(test_result_collector)
        @test_result_collector = test_result_collector
        super
      end

      def example_passed(example)
        @test_result_collector.add_result(to_test_result(example))
      end

      def example_failed(example)
        @test_result_collector.add_result(to_test_result(example))
      end

      def close
        @test_result_collector.finish
      end

      private

      def to_test_result(example)
        { :identifier => RelativePath.convert(example.location),
          :file_path => RelativePath.convert(example.file_path),
          :status => example.execution_result[:status],
          :started_at => example.execution_result[:started_at],
          :run_time => example.execution_result[:run_time]
        }
      end
    end
  end
end
