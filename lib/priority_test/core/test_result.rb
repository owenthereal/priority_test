module PriorityTest
  module Core
    class TestResult < ::Sequel::Model
      include PriorityTest::Core::ValidationsHelper

      PASSED_STATUS = 'passed'
      FAILEDED_STATUS = 'failed'

      many_to_one :context, :class => PriorityTest::Core::Test.name, :key => :test_id

      def passed?
        status == PASSED_STATUS
      end

      def failed?
        not passed?
      end

      def validate
        validates_presence [ :status, :started_at, :run_time ]
        validates_includes [ PASSED_STATUS, FAILEDED_STATUS ], :status
      end
    end
  end
end
