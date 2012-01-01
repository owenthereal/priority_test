unless defined? PriorityTest
  $:.unshift File.expand_path('../../lib', __FILE__)
  require 'priority_test'
end

Dir[File.expand_path("support/**/*.rb", File.dirname(__FILE__))].each {|f| require f}

PriorityTest.env = 'test'

require 'logger'
PriorityTest.gateway_connection.logger = Logger.new(STDOUT)

RSpec.configure do |config|
  config.before :all do
    # trigger shcema creation
    PriorityTest.service
  end

  config.around :each do |example|
    PriorityTest.gateway_connection.transaction(:rollback => :always){example.call}
  end
end
