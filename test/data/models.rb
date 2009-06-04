# The models are pretty much the same.

class Article < ActiveRecord::Base
  acts_as_featured
end

class Post < ActiveRecord::Base
  acts_as_featured
end
