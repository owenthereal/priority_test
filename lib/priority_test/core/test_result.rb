module PriorityTest
  module Core
    class TestResult
      PASSED_STATUS = 'passed'
      FAILEDED_STATUS = 'failed'

      attr_reader :identifier, :file_path, :status, :started_at, :run_time

      def initialize(attributes = {})
        @identifier = attributes[:identifier]
        @file_path = attributes[:file_path]
        @status = attributes[:status]
        @started_at = attributes[:started_at]
        @run_time = attributes[:run_time]
      end

      def passed?
        status == PASSED_STATUS
      end

      def failed?
        not passed?
      end
    end
  end
end
