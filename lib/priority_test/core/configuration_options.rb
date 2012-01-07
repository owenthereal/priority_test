module PriorityTest
  module Core
    class ConfigurationOptions
      def initialize(args)
        @args = args
      end

      def configure(config)
        options.each do |key, value|
          config.send("#{key}=", options[key]) if config.respond_to?("#{key}=")
        end
      end

      def options
        @options ||= begin
                       env_opts = env_options
                       command_line_options.merge(env_opts)
                     end
      end

      def env_options
        ENV["PT_OPTS"] ? OptionParser.parse_options(ENV["PT_OPTS"].split) : {}
      end

      def command_line_options
        OptionParser.parse!(@args)
      end
    end
  end
end
