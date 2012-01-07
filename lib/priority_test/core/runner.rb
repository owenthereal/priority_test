module PriorityTest
  module Core
    module Runner
      def self.autorun
        return if installed_at_exit?
        run(ARGV)
        @installed_at_exit = true
      end
      AT_EXIT_HOOK_BACKTRACE_LINE = "#{__FILE__}:#{__LINE__ - 2}:in `autorun'"

      def self.installed_at_exit?
        @installed_at_exit ||= false
      end

      def self.run(args)
        config_options = ConfigurationOptions.new(args)
        config = PriorityTest.configuration
        config_options.configure(config)

        if config.test_framework == 'rspec'
          require 'rspec/autorun'
        end
      end
    end
  end
end
