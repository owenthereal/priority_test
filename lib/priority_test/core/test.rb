module PriorityTest
  module Core
    class Test < ::Sequel::Model
      plugin :validation_helpers

      one_to_many :results, :class => PriorityTest::Core::TestResult.name
      one_to_many :recent_results, :class => PriorityTest::Core::TestResult.name, :order => :started_at.desc, :limit => 5 # make it configurable

      def validate
        validates_presence [ :identifier, :file_path ]
      end

      def recent_results_key
        recent_results_key = recent_results.collect { |r| r.passed? ? 'P' : 'F' }.join
        recent_results_key << 'P' * (5 - recent_results_key.size) if recent_results_key.size < 5
        recent_results_key
      end

      def update_statistics
        self.update(:priority => Priority[recent_results_key])
      end

      def self.all_in_priority_order
        self.eager(:recent_results).order(:priority).all
      end
    end
  end
end
