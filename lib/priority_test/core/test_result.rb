module PriorityTest
  module Core
    class TestResult
      attr_accessor :identifier, :file_path, :status, :started_at, :run_time

      def initialize(attributes={})
        @identifier = attributes.delete(:identifier)
        @file_path = attributes.delete(:file_path)
        @status = attributes.delete(:status)
        @started_at = attributes.delete(:started_at)
        @run_time = attributes.delete(:run_time)
      end

      def passed?
        status == "passed"
      end

      def failed?
        not passed?
      end

      def to_hash
        {
          :identifier => identifier,
          :file_path => file_path,
          :status => status,
          :started_at => started_at,
          :run_time => run_time
        }
      end
    end
  end
end
