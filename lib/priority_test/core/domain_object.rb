require 'active_model'

module PriorityTest
  module Core
    module DomainObject
      def self.included(context)
        super

        context.send(:include, InstanceMethods)
        context.extend(ClassMethods)

        context.send(:include, ::ActiveModel::AttributeMethods)
        context.send(:include, ::ActiveModel::Dirty)
        context.send(:include, ::ActiveModel::Validations)
      end

      private_class_method :included

      module InstanceMethods
        attr_reader :attributes

        def initialize(attributes = {})
          @attributes = attributes
        end
      end

      module ClassMethods
        def property(name)
          define_method(name) do
            attributes[name]
          end

          define_method("#{name}=") do |val|
            send("#{name}_will_change!") unless val == send(name)
            attributes[name] = val
          end

          define_attribute_method name
        end
      end
    end
  end
end
