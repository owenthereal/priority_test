require 'spec_helper'

module PriorityTest::Core
  describe OptionParser do
    let(:parser) { OptionParser.new }

    context "test-framework" do
      it "parses available test-framework" do
        args = ['rspec', 'file1']
        options = parser.parse!(args)

        options[:test_framework].should == 'rspec'
        args.size.should == 1
      end

      it "returns nil if test-framework not supported" do
        args = ['foo', 'file1']
        expect {
          options = parser.parse!(args)
        }.to raise_error(::OptionParser::InvalidArgument)
      end
    end

    context "options" do
      it "parses options" do
        args = ['rspec', '--priority', 'file1']
        options = parser.parse!(args)

        options[:priority].should be_true
        args.size.should == 1
      end

      it "ignore extra options" do
        args = ['rspec', '--priority', 'file1', '-fp']
        options = parser.parse!(args)

        options[:priority].should be_true
        args.size.should == 2
      end
    end
  end
end
