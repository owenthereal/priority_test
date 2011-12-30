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
require_path 'core/test'
require_path 'core/test_result'
require_path 'core/service'

require_path 'gateways'

require_path 'version'

module PriorityTest
  autoload :RSpec2, 'priority_test/rspec2'

  def self.start
    if defined?(RSpec)
      PriorityTest::RSpec2.setup
    end
  end

  class << self
    attr_accessor :env
  end
  self.env = ""
end
