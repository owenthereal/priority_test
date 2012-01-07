require_path 'core/configuration'
require_path 'core/configuration_options'
require_path 'core/option_parser'
require_path 'core/runner'
require_path 'core/priority'
require_path 'core/validations_helper'
require_path 'core/all_tests'
require_path 'core/service'
require_path 'core/test_result_collector'
require_path 'core/priority_sort_element'

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
