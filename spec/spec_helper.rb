unless defined? PriorityTest
  $:.unshift File.expand_path('../../lib', __FILE__)
  require 'priority_test'
end

Dir[File.expand_path("support/**/*.rb", File.dirname(__FILE__))].each {|f| require f}

RSpec.configure do |config|

end
