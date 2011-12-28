require 'spec_helper'

describe PriorityTest::RSpec2::Formatter do
  it "adds to test result" do
    passed_examples = [
      double('passed example',
             :location => "location",
             :file_path => "file_path",
             :description => "passed example",
             :execution_result => { :status => 'passed', :started_at => Time.now, :run_time => 1}
            )
    ]

    failed_examples = [
      double('failed spec 1',
             :location => "location",
             :file_path => "file_path",
             :description => "first failed example",
             :execution_result => { :status => 'failed', :started_at => Time.now, :run_time => 1, :exception => Exception.new }
            ),
      double('failed spec 2',
             :location => "location",
             :file_path => "file_path",
             :description => "second failed example",
             :execution_result => { :status => 'failed', :started_at => Time.now, :run_time => 1, :exception => Exception.new }
            )
    ]

    test_result = PriorityTest::Core::TestResult.new
    formatter = PriorityTest::RSpec2::Formatter.new(test_result)

    passed_examples.each {|e| formatter.example_passed(e) }
    failed_examples.each {|e| formatter.example_failed(e) }

    test_result.passed_tests.size.should == 1
    test_result.failed_tests.size.should == 2
  end
end
