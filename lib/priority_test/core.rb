module PriorityTest
  module Core ; end

  def self.test_result
    @test_result ||= Core::TestResult.new
  end

  def self.service
    @service ||= Core::Service.new(gateway)
  end

  def self.gateway
    @gateway ||= Gateways::Sequel.new(Gateways::Connection.create)
  end
end
