require 'spec_helper'

module PriorityTest::Gateways
  describe Sequel do
    # before :all do
    #   @gateway = Sequel.new(Connection.create)
    # end

    # subject { @gateway }

    # it "bulk create tests" do
    #   tests = [
    #     TestFactory.create_test_result(:identifier => 'identifier1', :file_path => 'file_path1', :status => 'passed'),
    #     TestFactory.create_test_result(:identifier => 'identifier2', :file_path => 'file_path2', :status => 'failed')
    #   ]

    #   subject.bulk_create_test_results(tests)
    #   subject.dataset.count.should == 2
    # end

    # describe "#recent_test_results" do
    #   it "loads 5 recent test results" do
    #     test_results = []

    #     10.times do |i|
    #       test_results << testfactory.create_test_result(:identifier => "identifier1", :file_path => "file_path1", :status => 'failed', :started_at => mktime(i))
    #       test_results << testfactory.create_test_result(:identifier => "identifier2", :file_path => "file_path2", :status => 'failed', :started_at => mktime(i + 1))
    #     end

    #     subject.bulk_create_test_results(test_results)

    #     test_results = subject.recent_test_results

    #     test_results.size.should == 10
    #   end

    #   def mktime(minutes)
    #     time.mktime(1984, 10, 28, 0, minutes, 0)
    #   end
    # end
  end
end

