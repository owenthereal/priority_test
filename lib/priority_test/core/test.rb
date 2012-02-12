module PriorityTest
  module Core
    class Test
      attr_reader :identifier, :results

      def initialize(attributes = {})
        @identifier = attributes[:identifier]
        @results = []
      end

      def add_result(result_attributes)
        results << TestResult.new(result_attributes)
      end

      def <=>(other)
        result = (priority <=> other.priority) if priority && other.priority
        result = (avg_run_time <=> other.avg_run_time) if (result == 0 || !result) && avg_run_time && other.avg_run_time
        result || 0
      end

      def results_key
        results_key = results.collect { |r| r.passed? ? 'P' : 'F' }.join
        results_key << 'P' * (NUMBER_OF_RESULTS - results_key.size) if results_key.size < NUMBER_OF_RESULTS
        results_key[0..(NUMBER_OF_RESULTS-1)]
      end

      def update_statistics
        stats_to_update = {}
        prio = Priority[results_key]
        stats_to_update.merge!(:priority => prio) if prio
        stats_to_update.merge!(:avg_run_time => calculate_avg_run_time) if results.size > 0

        self.update(stats_to_update)
      end

      def priority?
        Priority.in_priority_set?(priority)
      end

      private

      def calculate_avg_run_time
        results.collect(&:run_time).reduce(:+) / results.size
      end
    end
  end
end
