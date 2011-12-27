module PriorityTest
  class Test
    attr_accessor :identifier, :file_path, :status, :started_at, :run_time

    def initialize(attributes={})
      @identifier = attributes.delete(:identifier)
      @file_path = attributes.delete(:file_path)
      @status = attributes.delete(:status)
      @started_at = attributes.delete(:started_at)
      @run_time = attributes.delete(:run_time)
    end
  end
end
