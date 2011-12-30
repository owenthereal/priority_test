module PriorityTest
  module Gateways
    autoload :Connection, 'priority_test/gateways/connection'
    autoload :Sequel, 'priority_test/gateways/sequel'
  end
end
