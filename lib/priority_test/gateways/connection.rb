require 'sequel'

module PriorityTest
  module Gateways
    module Connection
      def self.create
        if PriorityTest.env =~ /test/i
          ::Sequel.sqlite
        else
          ::Sequel.sqlite('./.priority_test.sqlite3')
        end
      end
    end
  end
end
