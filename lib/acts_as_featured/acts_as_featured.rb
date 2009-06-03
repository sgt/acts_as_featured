module ActiveRecord
  module Acts
    module Featured
      
      def self.included(base)
        base.extend(ClassMethods)
      end
      
      module ClassMethods
        def acts_as_featured
          include InstanceMethods
        end
      end
      
      module InstanceMethods
        def self.included(base)
        end
      end
      
    end
  end
end
