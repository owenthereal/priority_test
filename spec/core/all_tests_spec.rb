require 'spec_helper'

module PriorityTest::Core
  describe AllTests do
    it "gets test by identifier" do
      test = Test.new(:identifier => "id")
      all_tests = AllTests.new([test])
      all_tests.get_test("id").should be
    end

    it "adds test by params" do
      all_tests = AllTests.new

      all_tests.add_test(:identifier => "id", :file_path => "path")
      all_tests.get_test("id").should be
    end

    context "#add_test_result" do
      it "adds test result by params" do
        all_tests = AllTests.new

        test = all_tests.add_test(:identifier => "id", :file_path => "path")
        expect {
          all_tests.add_test_result('id', :status => 'passed', :run_time => 1, :started_at => Time.now)
        }.to change {
          test.results.size
        }
      end

      it "updates priority" do
        all_tests = AllTests.new

        test = all_tests.add_test(:identifier => "id", :file_path => "path")
        expect {
          all_tests.add_test_result('id', :status => 'passed', :run_time => 1, :started_at => Time.now)
        }.to change {
          test.priority
        }
      end

      it "updates avg_run_time" do
        all_tests = AllTests.new

        test = all_tests.add_test(:identifier => "id", :file_path => "path")
        expect {
          all_tests.add_test_result('id', :status => 'passed', :run_time => 1, :started_at => Time.now)
        }.to change {
          test.avg_run_time
        }
      end
    end
  end
end
