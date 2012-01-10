require 'spec_helper'

module PriorityTest::Core
  describe DomainObject do
    subject do
      Class.new do
        include DomainObject
      end
    end

    it "coerces property type" do
      subject.property :count, Integer
      instance = subject.new(:count => '1')
      instance.count.should be_kind_of(Integer)
      instance.count.should == 1
    end

    context "dirty property" do
      it "tracks dirty property" do
        subject.property :name, String
        instance = subject.new
        instance.name.should be_nil
        instance.should_not be_changed

        instance.name = "Bob"
        instance.name.should == "Bob"
        instance.should be_changed
        instance.changed.should include('name')
      end

      it "tracks diry property by coercing them" do
        subject.property :time, DateTime
        instance = subject.new
        instance.time.should be_nil
        instance.should_not be_changed

        now = DateTime.now
        instance.time = now.to_s
        instance.time.should be_kind_of(DateTime)
        instance.should be_changed
        instance.changed.should include('time')
      end
    end

    it "validates property" do
      subject.property :first_name, String
      subject.validates_each :first_name do |model, attr, val|
        model.errors.add attr, 'cannot be empty' if val.empty?
      end

      instance = subject.new
      instance.first_name = ""
      instance.should be_invalid
      instance.errors.should include(:first_name)
    end
  end
end
