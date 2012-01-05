patch = Module.new do
  def example_groups
    example_groups = super
    example_groups.sort! { |eg1, eg2| PriorityTest::RSpec2::ExampleGroupSorter.sort(eg1, eg2) }
  end
end
RSpec.world.extend(patch)
