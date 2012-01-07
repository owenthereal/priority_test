module PriorityTest
  module Core
    class Configuration
      def self.add_setting(name, opts={})
        define_method("#{name}=") { |val| settings[name] = val}
        define_method(name)       { settings.has_key?(name) ? settings[name] : opts[:default] }
        define_method("#{name}?") { send name }
      end

      add_setting :test_framework
      add_setting :database, :default => 'sqlite://priority-test.db'
      add_setting :priority, :default => false

      def settings
        @settings ||= {}
      end

      def add_setting(name, opts={})
        self.class.add_setting(name, opts)
      end
    end
  end
end
