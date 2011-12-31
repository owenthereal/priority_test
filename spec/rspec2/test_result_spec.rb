require 'spec_helper'

describe PriorityTest::Core::TestResult do
  it "capures passed test result" do
    test_result = PriorityTest::Core::TestResult.new
    test_result_collector = PriorityTest::Core::TestResultCollector.new(test_result)
    formatter = PriorityTest::RSpec2::Formatter.new(test_result_collector)
    RSpecFactory.passing_spec.run(RSpec::Core::Reporter.new(formatter))

    test_result.passed_tests.size.should == 1

    passed_test = test_result.passed_tests.first
    passed_test.identifier.should be
    passed_test.file_path.should be
    passed_test.status.should == 'passed'
    passed_test.run_time.should be
    passed_test.started_at.should be
  end

  it "capures failed test result" do
    test_result = PriorityTest::Core::TestResult.new
    test_result_collector = PriorityTest::Core::TestResultCollector.new(test_result)
    formatter = PriorityTest::RSpec2::Formatter.new(test_result_collector)
    RSpecFactory.failing_spec.run(RSpec::Core::Reporter.new(formatter))

    test_result.failed_tests.size.should == 1

    failed_test = test_result.failed_tests.first
    failed_test.identifier.should be
    failed_test.file_path.should be
    failed_test.status.should == 'failed'
    failed_test.run_time.should be
    failed_test.started_at.should be
  end
end
