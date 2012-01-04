ENV['PRIORITY_TEST_ENV'] = 'test'

unless defined? PriorityTest
  $:.unshift File.expand_path('../../lib', __FILE__)
  require 'priority_test'
end

Dir[File.expand_path("support/**/*.rb", File.dirname(__FILE__))].each {|f| require f}

require 'logger'
PriorityTest::Gateway::Sequel.database.logger = Logger.new(STDOUT)

RSpec.configure do |config|
  config.around :each do |example|
    PriorityTest::Gateway::Sequel.database.transaction(:rollback => :always){example.call}
  end
end
