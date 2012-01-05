require 'rspec/core'
require_path 'rspec2'

RSpec.configure do |config|
  config.formatters << PriorityTest::RSpec2.formatter
  config.run_all_when_everything_filtered = true
  config.inclusion_filter = { :priority_test => PriorityTest::RSpec2.filter }
  config.extend PriorityTest::RSpec2::Ordered
end
