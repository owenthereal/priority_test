module PriorityTest
  module Runner
    def self.start
      if defined?(RSpec)
        PriorityTest::RSpec2.setup
      end
    end
  end
end

PriorityTest::Runner.start
