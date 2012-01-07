require 'spec_helper'

module PriorityTest::Core
  describe Configuration do
    let(:config) { Configuration.new }

    describe "#add_setting" do
      context "with no additional options" do
        before { config.add_setting :custom_option }

        it "defaults to nil" do
          config.custom_option.should be_nil
        end

        it "adds a predicate" do
          config.custom_option?.should be_false
        end

        it "can be overridden" do
          config.custom_option = "a value"
          config.custom_option.should eq("a value")
        end
      end

      context "with :default => 'a value'" do
        before { config.add_setting :custom_option, :default => 'a value' }

        it "defaults to 'a value'" do
          config.custom_option.should eq("a value")
        end

        it "returns true for the predicate" do
          config.custom_option?.should be_true
        end

        it "can be overridden with a truthy value" do
          config.custom_option = "a new value"
          config.custom_option.should eq("a new value")
        end

        it "can be overridden with nil" do
          config.custom_option = nil
          config.custom_option.should eq(nil)
        end

        it "can be overridden with false" do
          config.custom_option = false
          config.custom_option.should eq(false)
        end
      end
    end
  end
end
