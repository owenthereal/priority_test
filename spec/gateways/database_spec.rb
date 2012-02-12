require 'spec_helper'

describe PriorityTest::Gateway::Database do
  before do
    @db = PriorityTest::Gateway::Sequel.database
    @gateway = PriorityTest::Gateway::Database.new(@db)
    @gateway.setup
  end

  context "#load_tests" do
    it "loads tests with recent x number of results" do
      10.times.each do |i|
        time = Time.mktime(1984, 10, 28, 0, i, 0)
        @gateway.add_test_result(:identifier => "id1", :file_path => "file1", :status => "passed", :run_time => 1, :started_at => time)
      end

      tests = @gateway.load_tests

      tests.size.should == 1
      tests.each do |test|
        test.results.size.should == 5

        (1..4).each do |i|
          previous_result = test.results[i - 1]
          current_result = test.results[i]
          previous_result.started_at.should > current_result.started_at
        end
      end
    end
  end
end
