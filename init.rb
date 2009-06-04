require 'acts_as_featured'
ActiveRecord::Base.send :include, ActiveRecord::Acts::Featured
ActionView::Base.send :include, ActsAsFeaturedHelper