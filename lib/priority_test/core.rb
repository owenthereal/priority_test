module PriorityTest
  module Core
    autoload :Config, 'priority_test/core/config'
    autoload :Priority, 'priority_test/core/priority'
    autoload :ValidationsHelper, 'priority_test/core/validations_helper'
    autoload :Test, 'priority_test/core/test'
    autoload :TestResult, 'priority_test/core/test_result'
    autoload :AllTests, 'priority_test/core/all_tests'
    autoload :TestAnalytics, 'priority_test/core/test_analytics'
    autoload :Service, 'priority_test/core/service'
    autoload :TestResultCollector, 'priority_test/core/test_result_collector'
  end

  class << self
    attr_accessor :env
  end
  self.env = ENV['PRIORITY_TEST_ENV'] || 'production'

  def self.config
    @config ||= Core::Config.new
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
