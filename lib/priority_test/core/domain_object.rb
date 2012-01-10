require 'virtus'
require 'active_model'

module PriorityTest
  module Core
    module DomainObject
      def self.included(context)
        super

        context.extend(ClassMethods)

        context.send(:include, ::Virtus)
        context.send(:include, ::ActiveModel::AttributeMethods)
        context.send(:include, ::ActiveModel::Dirty)
        context.send(:include, ::ActiveModel::Validations)
      end

      private_class_method :included

      module ClassMethods
        def property(name, type, options = {})
          attribute(name, type, options)

          define_method("#{name}=") do |val|
            send("#{name}_will_change!") unless val == send(name)
            super(val)
          end

          define_attribute_method name
        end
      end
    end
  end
end
