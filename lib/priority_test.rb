if defined?(require_relative)
  def require_pt(path)
    require_relative "priority_test/#{path}"
  end
else
  def require_pt(path)
    require "priority_test/#{path}"
  end
end

module PriorityTest
  class << self
    attr_accessor :env
  end
  self.env = ENV['PRIORITY_TEST_ENV'] || 'production'
end

require_pt 'core'
require_pt 'gateway'
require_pt 'version'

PriorityTest.configure do |config|
  if PriorityTest.env =~ /test/i
    config.database = 'sqlite:/'
  end
end

PriorityTest::Gateway.setup
