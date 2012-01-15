require 'rspec/core'

require_pt 'rspec2'
require_pt 'rspec2/patch/world'
require_pt 'rspec2/patch/example_group'

if ENV['PT_OPTS']
  config_options = PriorityTest::Core::ConfigurationOptions.new(['rspec'] + ENV['PT_OPTS'].split)
  config_options.configure(PriorityTest.configuration)
end

RSpec.configure do |config|
  config.formatters << PriorityTest::RSpec2.formatter

  if PriorityTest.configuration.priority?
    config.inclusion_filter = { :priority_filter => PriorityTest::RSpec2.filter }
    config.run_all_when_everything_filtered = true
  end

  # Patch RSpec::Core::ExampleGroup
  config.extend PriorityTest::RSpec2::Patch::ExampleGroup
end
