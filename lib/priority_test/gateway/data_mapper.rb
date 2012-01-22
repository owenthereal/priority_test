require 'data_mapper'

module PriorityTest
  module Gateway
    class DataMapper
      def self.setup
        ::DataMapper.setup(:default, PriorityTest.configuration.database)
        ::DataMapper.auto_upgrade!
        ::DataMapper.finalize
      end
    end
  end
end
