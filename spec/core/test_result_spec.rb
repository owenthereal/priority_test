require "spec_helper"

describe PriorityTest::Core::TestResult do
  subject { PriorityTest::Core::TestResult.new }

  [ :status, :started_at, :run_time ].each do |field|
    it "validates presence of #{field}" do
      expect {
        subject.save
      }.to raise_error {
        Sequel::ValidationFailed
      }

      subject.errors.should include(field)
    end
  end

  it "validates status to be 'passed' or 'failed'" do
    subject.status = 'foo'
    subject.validate
    subject.errors.should include(:status)

    subject.errors.clear

    subject.status = 'passed'
    subject.validate
    subject.errors.should_not include(:status)
  end
end
