module PriorityTest
  module Core ; end

  def self.test_result
    @test_result ||= Core::TestResult.new
  end

  def self.service
    @service ||= Core::Service.new(adapter)
  end

  def self.adapter
    @adapter ||= Adapters::Sequel.new(Adapters::Connection.create)
  end
end
