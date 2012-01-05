# Only works in RSpec 2.8 and after
if defined?(::RSpec::Core::Extensions::Ordered)
  require 'priority_test/rspec2/ordered'
  ::RSpec::Core::Extensions::Ordered.send(:include, PriorityTest::RSpec2::Ordered)
end
