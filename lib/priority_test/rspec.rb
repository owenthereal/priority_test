require 'rspec/core'
require 'priority_test/rspec2/patch/ordered'

module PriorityTest
  module Runner
    def self.start
      if defined?(::RSpec)
        PriorityTest::RSpec2.setup
      end
    end
  end
end

PriorityTest::Runner.start
