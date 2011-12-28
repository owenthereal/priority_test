module PriorityTest
  def self.test_result
    @test_result ||= TestResult.new
  end

  def self.service
    @service ||= Service.new(adapter)
  end

  def self.adapter
    @adapter ||= Adapters::Sequel.new(Adapters::Connection.create)
  end

  module Core ; end
end
