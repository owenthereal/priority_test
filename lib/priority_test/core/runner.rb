require 'optparse'

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
        priority_test_options = ['--priority-set']
        available_test_frameworks = ['rspec']

        options = {}
        opts_parser = OptionParser.new do |opts|
          opts.banner = <<-EOS
Usage: pt <test-framework> [options] [files or directories]

Available test framework
  * rspec

Available options
          EOS

          opts.on('--priority', 'Filter and run priority tests') do |o|
            options[:priority_test] = true
          end

          opts.on_tail("-h", "--help", "Show help") do
            puts opts
            exit
          end

          opts.on_tail('-v', '--version', 'Show version') do
            puts PriorityTest::VERSION
            exit
          end
        end

        begin
          opts_parser.parse!(args.clone)
        rescue OptionParser::InvalidOption
        end

        # Remove priority_test options and pass along
        args.reject! { |opts| priority_test_options.include?(opts) }

        test_framework = args.shift
        unless available_test_frameworks.include?(test_framework)
          puts "Invalid test framework: #{test_framework}"
          puts opts_parser
        end

        if test_framework == 'rspec'
          require 'rspec/autorun'
        end
      end
    end
  end
end
