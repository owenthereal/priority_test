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

module PriorityTest
  module Core
    # Remove dependency of Sequel so that it can move out of autoload
    autoload :Test, 'priority_test/core/test'
    autoload :TestResult, 'priority_test/core/test_result'
  end

  def self.configure
    yield configuration if block_given?
  end

  def self.configuration
    @configuration ||= Core::Configuration.new
  end

  def self.all_tests
    @all_tests ||= begin
                     tests = Core::Test.all_in_priority_order
                     Core::AllTests.new(tests)
                   end
  end

  def self.service
    @service ||= Core::Service.new(all_tests)
  end

  def self.test_result_collector
    @collector ||= Core::TestResultCollector.new(all_tests)
  end
end
