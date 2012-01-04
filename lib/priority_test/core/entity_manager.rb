module PriorityTest
  module Core
    class EntityManager
      def save(domain_object)
        domain_object.associations.each do |key, value|
          association_reflection = domain_object.class.association_reflection(key)

        end
          domain_object.save
      end

      def save_all(domain_objects)
        domain_objects(&:save)
      end

      def find(domain_object_class, primary_key)
        domain_object_class.find(domain_object_class.primary_key => primary_key)
      end

      def find_all(domain_object_class)
        domain_object_class.all
      end

      def filter(domain_object_class, *conds)
        domain_object_class.filter(*conds)
      end
    end
  end
end
