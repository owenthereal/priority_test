require 'spec_helper'

module PriorityTest::Gateways
  describe Sequel do
    before :all do
      @gateway = Sequel.new(Connection.create)
      @gateway.setup
    end

    subject { @gateway }

    it "bulk create tests" do
      tests = [
        TestFactory.create_test_result(:identifier => 'identifier1', :file_path => 'file_path1', :status => 'passed'),
        TestFactory.create_test_result(:identifier => 'identifier2', :file_path => 'file_path2', :status => 'failed')
      ]

      subject.bulk_create_test_results(tests)
      subject.dataset.count.should == 2
    end
  end
end

