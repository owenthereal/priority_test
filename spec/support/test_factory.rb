class TestFactory
  def self.create_test_result(attributes)
    attributes = { :started_at => Time.now, :run_time => 0.1 }.merge(attributes)
    PriorityTest::Core::TestResult.new(attributes)
  end
end
