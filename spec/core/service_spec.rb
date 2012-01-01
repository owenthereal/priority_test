require 'spec_helper'

module PriorityTest::Core
  describe Service do
    subject { PriorityTest.service }

    describe "#load_all_tests_in_priority_order" do
      it "loads tests ordered by failed status" do
        passed_test = TestFactory.create_test_result(:identifier => 'identifier1', :file_path => 'file_path1', :status => 'passed')
        failed_test = TestFactory.create_test_result(:identifier => 'identifier2', :file_path => 'file_path2', :status => 'failed')

        test_result = TestSuiteResult.new
        test_result.add_passed_test(passed_test)
        test_result.add_failed_test(failed_test)

        subject.save(test_result)

        tests = subject.load_all_tests_in_priority_order
        tests.size.should == 2
        tests.first.identifier.should == "identifier2"
      end

      it "loads tests ordered by failure rate" do
        test_result = TestSuiteResult.new

        # failure rate is 50%
        identifier1_failed_test = TestFactory.create_test_result(:identifier => 'identifier1', :file_path => 'file_path1', :status => 'failed')
        identifier1_passed_test = TestFactory.create_test_result(:identifier => 'identifier1', :file_path => 'file_path1', :status => 'failed')
        test_result.add_failed_test(identifier1_failed_test)
        test_result.add_passed_test(identifier1_passed_test)

        # failure rate is 100%
        identifier2_failed_test1 = TestFactory.create_test_result(:identifier => 'identifier2', :file_path => 'file_path2', :status => 'failed')
        identifier2_failed_test2 = TestFactory.create_test_result(:identifier => 'identifier2', :file_path => 'file_path2', :status => 'failed')
        test_result.add_failed_test(identifier2_failed_test1)
        test_result.add_failed_test(identifier2_failed_test2)

        subject.save(test_result)

        tests = subject.load_all_tests_in_priority_order
        tests.size.should == 2
        tests.first.identifier.should == "identifier2"
      end

      it "loads tests ordered by run_time" do
        passed_test1 = TestFactory.create_test_result(:identifier => 'identifier1', :file_path => 'file_path1', :status => 'passed', :run_time => 2)
        passed_test2 = TestFactory.create_test_result(:identifier => 'identifier2', :file_path => 'file_path2', :status => 'passed', :run_time => 1)

        test_result = TestSuiteResult.new
        test_result.add_passed_test(passed_test1)
        test_result.add_passed_test(passed_test2)

        subject.save(test_result)

        tests = subject.load_all_tests_in_priority_order
        tests.size.should == 2
        tests.first.identifier.should == "identifier2"
      end
    end
  end
end
