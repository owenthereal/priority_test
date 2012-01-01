module PriorityTest
  module Core ; end

  def self.service
    @service ||= Core::Service.new(gateway)
  end

  def self.gateway
    @gateway ||= begin
                   gateway = Gateways::Sequel.new(gateway_connection)
                   gateway.setup
                   gateway
                 end
  end

  def self.gateway_connection
    @gateway_connection ||= Gateways::Connection.create
  end
end
