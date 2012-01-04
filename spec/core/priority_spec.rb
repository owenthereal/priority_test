require 'spec_helper'

module PriorityTest::Core
  describe Priority do
    it "has 32 priority rankings" do
      Priority::PRIORITY_RANKINGS.size.should == 32
    end
  end
end
