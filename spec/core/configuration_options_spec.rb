require 'spec_helper'

module PriorityTest::Core
  describe ConfigurationOptions do
    it "sets configs" do
      command_line_args = ["rspec", "file1", "--priority"]

      config = Configuration.new
      config_options = ConfigurationOptions.new(command_line_args)
      config_options.configure(config)

      config.test_framework.should == 'rspec'
      config.priority.should == true
    end
  end
end
