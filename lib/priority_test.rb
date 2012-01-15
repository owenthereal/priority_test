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

# Core
require_pt 'core'
require_pt 'core/configuration'
require_pt 'core/configuration_options'
require_pt 'core/option_parser'
require_pt 'core/runner'
require_pt 'core/priority'
require_pt 'core/domain_object'
require_pt 'core/validations_helper'
require_pt 'core/all_tests'
require_pt 'core/service'
require_pt 'core/test_result_collector'
require_pt 'core/priority_sort_element'

require_pt 'gateway'
require_pt 'gateway/sequel'

require_pt 'version'

PriorityTest.configure do |config|
  if PriorityTest.env =~ /test/i
    config.database = 'sqlite:/'
  end
end

PriorityTest::Gateway.setup
