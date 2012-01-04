require 'spec_helper'

module PriorityTest::Core
  describe Test do
    context "validation" do
      subject { Test.new }

      [ :identifier, :file_path ].each do |field|
        it "validates presence of #{field}" do
          expect {
            subject.save
          }.to raise_error {
            Sequel::ValidationFailed
          }

          subject.errors.should include(field)
        end
      end
    end

    describe "#recent_results" do
      it "loads last 5 results" do
        test = Test.create(:identifier => 'identifier1', :file_path => 'file_path1')
        10.times.each do |i|
          time = Time.mktime(1984, 10, 28, 0, i, 0)
          test.add_result(:status => 'passed', :run_time => 1, :started_at => time)
        end

        test.results.size.should == 5
        (1..4).each do |i|
          previous_result = test.results[i - 1]
          current_result = test.results[i]
          previous_result.started_at.should > current_result.started_at
        end
      end
    end

    describe "#recent_result_key" do
      it "returns a key with P representing passed and F representing failed" do
        test = Test.create(:identifier => 'identifier1', :file_path => 'file_path1')
        10.times.each do |i|
          status = ((i + 1) % 2 == 0) ? 'passed' : 'failed'
          time = Time.mktime(1984, 10, 28, 0, i, 0)
          test.add_result(:status => status, :run_time => 1, :started_at => time)
        end

        test.results_key.should == "PFPFP"
      end

      it "populates with P in the end if number of results is less than 5" do
        test = Test.create(:identifier => 'identifier1', :file_path => 'file_path1')
        3.times.each do |i|
          time = Time.mktime(1984, 10, 28, 0, i, 0)
          test.add_result(:status => 'failed', :run_time => 1, :started_at => time)
        end

        test.results_key.should == "FFFPP"
      end
    end

    describe ".all_in_priority_order" do
      it "returns all tests ordered by priority" do
        10.times.each do |i|
          Test.create(:identifier => "id#{i}", :file_path => "path#{i}", :priority => i)
        end

        tests = Test.all_in_priority_order
        tests.size.should == 10

        (1..9).each do |i|
          previous_test = tests[i-1]
          current_test = tests[i]
          previous_test.priority.should < current_test.priority
        end
      end

      it "returns all tests ordered by avg_run_time" do
        10.times.each do |i|
          Test.create(:identifier => "id#{i}", :file_path => "path#{i}", :avg_run_time => i)
        end

        tests = Test.all_in_priority_order
        tests.size.should == 10

        (1..9).each do |i|
          previous_test = tests[i-1]
          current_test = tests[i]
          previous_test.avg_run_time.should < current_test.avg_run_time
        end
      end

      it "eagerly loads recent results" do
        test = Test.create(:identifier => 'identifier1', :file_path => 'file_path1')
        3.times.each do |i|
          time = Time.mktime(1984, 10, 28, 0, i, 0)
          test.add_result(:status => 'failed', :run_time => 1, :started_at => time)
        end

        tests = Test.all_in_priority_order
        tests.size.should == 1
        tests.first.associations[:results].should be_any
      end
    end
  end
end
