class RSpecFactory
  def self.passing_spec
    RSpec::Core::ExampleGroup.describe("passing spec") do
      it "passes" do
        1.should eq(1)
      end
    end
  end

  def self.failing_spec
    RSpec::Core::ExampleGroup.describe("failing spec") do
      it "fails" do
        1.should eq(2)
      end
    end
  end
end
