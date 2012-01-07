require 'rspec/core'
require_path 'rspec2'
require_path 'rspec2/patch/world'
require_path 'rspec2/patch/example_group'

RSpec.configure do |config|
  config.formatters << PriorityTest::RSpec2.formatter

  if PriorityTest.configuration.priority?
    config.run_all_when_everything_filtered = true
    config.inclusion_filter = { :priority_filter => PriorityTest::RSpec2.filter }
  end

  # Patch RSpec::Core::ExampleGroup
  config.extend PriorityTest::RSpec2::Patch::ExampleGroup
end
