module PriorityTest
  module Core
    module ValidationsHelper
      def validates_presence(args)
        args.each do |arg|
          value = send(arg)
          errors.add(arg, 'cannot be empty') if !value || value.to_s.empty?
        end
      end

      def validates_includes(includes, arg)
        value = send(arg)
        errors.add(arg, "should be in list #{includes}") unless includes.include?(value)
      end
    end
  end
end
