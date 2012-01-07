module PriorityTest
  module Core
    class ConfigurationOptions
      def initialize(args=[])
        @args = args
      end

      def configure(config)
        options.each do |key, value|
          config.send("#{key}=", options[key]) if config.respond_to?("#{key}=")
        end
      end

      def options
        @options ||= OptionParser.parse!(@args)
      end
    end
  end
end
