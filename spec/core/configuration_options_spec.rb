require 'spec_helper'

module PriorityTest::Core
  describe ConfigurationOptions do
    it "parses ENV['PT_OPTS'] first and then command line args" do
      command_line_args = ["rspec", "file1"]
      ENV["PT_OPTS"] = "--priority file2"

      config_options = ConfigurationOptions.new(command_line_args)
      options = config_options.options

      options[:priority].should == true
      options[:test_framework].should == 'rspec'
    end
  end
end
