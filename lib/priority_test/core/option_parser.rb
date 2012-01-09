require 'optparse'

module PriorityTest
  module Core
    class OptionParser
      AVAILABLE_TEST_FRAMEWORKS = ['rspec']
      OPTIONS = ['--priority']

      def self.parse!(args)
        new.parse!(args)
      end

      def parse_options(args)
        options = {}
        opts_parser = parser(options)

        if args.empty?
          puts opts_parser
          return options
        end

        begin
          opts_parser.parse!(args.clone)
        rescue ::OptionParser::InvalidOption
        end

        remove_parsed_options(args)

        options
      end

      def parse!(args)
        options = parse_options(args)
        options[:test_framework] = parse_test_framework(args)

        options
      end

      def parser(options)
        ::OptionParser.new do |parser|
          parser.banner = <<-EOS
Usage: pt <test-framework> [options] [files or directories]

Test framework:
  * rspec

Options:
          EOS

          parser.on('--priority', 'Filter and run priority tests') do |o|
            options[:priority] = true
          end

          parser.on_tail("-h", "--help", "Show help") do
            puts parser
            exit
          end

          parser.on_tail('-v', '--version', 'Show version') do
            puts PriorityTest::VERSION
            exit
          end
        end
      end

      def parse_test_framework(args)
        test_framework = args.shift
        if AVAILABLE_TEST_FRAMEWORKS.include?(test_framework)
          test_framework
        else
          puts "Invalid test framework: #{test_framework}"
          puts "Run `pt -h` for more info"
          raise ::OptionParser::InvalidArgument
        end
      end

      def remove_parsed_options(args)
        args.reject! { |arg| OPTIONS.include?(arg) }
      end
    end
  end
end
