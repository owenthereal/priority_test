require_path 'gateway/sequel'

module PriorityTest
  module Gateway
    def self.setup
      PriorityTest::Gateway::Sequel.setup
    end

    def self.teardown
      PriorityTest::Gateway::Sequel.teardown
    end
  end
end
