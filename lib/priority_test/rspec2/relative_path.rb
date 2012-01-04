module PriorityTest
  module RSpec2
    module RelativePath
      def self.convert(absolute_path)
        relative_path = absolute_path.sub(File.expand_path("."), ".")
        relative_path = relative_path.sub(/\A([^:]+:\d+)$/, '\\1')
        return nil if relative_path == '-e:1'

        relative_path
      end
    end
  end
end
