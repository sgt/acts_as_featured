require File.join( File.dirname(__FILE__), 'test_helper' )

require 'active_record'

require 'acts_as_featured'

class FeaturedTest < ActiveSupport::TestCase
  def setup
    reset_db!
  end
end
