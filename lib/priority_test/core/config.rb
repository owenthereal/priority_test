module PriorityTest
  module Core
    class Config
      def initialize
        @configs = {}
      end

      def set(key, value)
        @configs[key] = value
      end
      alias_method :[]=, :set

      def get(key)
        @configs[key]
      end
      alias_method :[], :get
    end
  end
end
