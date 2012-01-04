require 'spec_helper'

describe PriorityTest::Core::Config do
  subject { PriorityTest::Core::Config.new }

  it "sets key/value pair with []=" do
    subject[:key] = :value
    subject[:key].should == :value
  end
end
