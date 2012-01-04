if defined?(require_relative)
  def require_path(path)
    require_relative "priority_test/#{path}"
  end
else
  def require_path(path)
    require "priority_test/#{path}"
  end
end

require_path 'core'
require_path 'gateway'
require_path 'version'

module PriorityTest
  autoload :RSpec2, 'priority_test/rspec2'
end

if PriorityTest.env =~ /test/i
  PriorityTest.config[:database] = 'sqlite:/'
else
  PriorityTest.config[:database] = ENV['PRIORITY_TEST_DATABASE'] || 'sqlite://priority-test.db'
end

PriorityTest::Gateway.setup
