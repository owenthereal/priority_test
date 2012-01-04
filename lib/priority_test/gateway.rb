module PriorityTest
  module Gateway
    autoload :Sequel, 'priority_test/gateway/sequel'

    def self.setup
      PriorityTest::Gateway::Sequel.setup
    end

    def self.teardown
      PriorityTest::Gateway::Sequel.teardown
    end
  end
end
