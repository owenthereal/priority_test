module PriorityTest
  module Core
    class Test < ::Sequel::Model
      include PriorityTest::Core::ValidationsHelper

      one_to_many :results, :class => PriorityTest::Core::TestResult.name, :class => PriorityTest::Core::TestResult.name do |ds|
        ds.order(:started_at.desc).limit(5) # make it configurable
      end

      def validate
        validates_presence [ :identifier, :file_path ]
      end

      def results_key
        results_key = results.collect { |r| r.passed? ? 'P' : 'F' }.join
        results_key << 'P' * (5 - results_key.size) if results_key.size < 5
        results_key[0..4]
      end

      def update_statistics
        prio = Priority[results_key]
        self.update(:priority => prio) if prio
      end

      def priority?
        self.priority <= Priority::PRIORITY_THRESHOLD
      end

      def self.all_in_priority_order
        self.eager(:results).order(:priority).all
      end
    end
  end
end
