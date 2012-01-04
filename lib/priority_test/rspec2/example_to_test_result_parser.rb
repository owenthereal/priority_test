module PriorityTest
  module RSpec2
    module ExampleToTestResultParser
      def self.parse(example)
        { :identifier => relative_path(example.location),
          :file_path => relative_path(example.file_path),
          :status => example.execution_result[:status],
          :started_at => example.execution_result[:started_at],
          :run_time => example.execution_result[:run_time]
        }
      end

      private

      def self.relative_path(line)
        line = line.sub(File.expand_path("."), ".")
        line = line.sub(/\A([^:]+:\d+)$/, '\\1')
        return nil if line == '-e:1'

        line
      end
    end
  end
end
