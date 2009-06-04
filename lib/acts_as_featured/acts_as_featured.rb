module ActiveRecord
  module Acts
    module Featured
      
      def self.included(base)
        base.extend(ClassMethods)
      end
      
      module ClassMethods
        def acts_as_featured
          has_many :features, :as => :featured, :dependent => :destroy, :readonly => true
          
          include InstanceMethods
        end
      end
      
      module InstanceMethods
        # Set this object to be featured at the designated named feature spot.
        def feature_at!(feature_name)
          raise ArgumentError, "feature name cannot be nil" if feature_name.nil?
          f = Feature.find_or_initialize_by_name(:name=>feature_name.to_s)
          f.featured = self
          f.save
        end
        
        # Returns an array of feature spot names where this object is currently featured.
        def featured_at
          features.map { |f| f.name }
        end
        
        # Returns true if this object is featured at this feature spot.
        def featured_at?(feature_name)
          featured_at.include?(feature_name.to_s)
        end
      end
      
    end
  end
end
