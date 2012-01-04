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
  end
end
