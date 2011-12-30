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
        create_test(:identifier => 'identifier1', :file_path => 'file_path1', :status => 'passed'),
        create_test(:identifier => 'identifier2', :file_path => 'file_path2', :status => 'failed')
      ]

      subject.bulk_create(tests)
      subject.dataset.count.should == 2
    end

    def create_test(attributes)
      attributes = { :started_at => Time.now, :run_time => 0.1 }.merge(attributes)
      PriorityTest::Core::Test.new(attributes)
    end
  end
end

