require 'rspec/core'
require_path 'rspec2'
require_path 'rspec2/patch/world'
require_path 'rspec2/patch/example_group'

RSpec.configure do |config|
  config.formatters << PriorityTest::RSpec2.formatter
  config.run_all_when_everything_filtered = true
  config.inclusion_filter = { :priority_test => PriorityTest::RSpec2.filter }

  # Patch RSpec::Core::ExampleGroup
  config.extend PriorityTest::RSpec2::Patch::ExampleGroup
end
