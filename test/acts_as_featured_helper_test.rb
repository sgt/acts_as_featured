require File.join( File.dirname(__FILE__), 'test_helper' )

class FeaturedTest < ActiveSupport::TestCase
  
  include ActsAsFeaturedHelper
  
  def setup
    reset_db!
  end

  test "empty feature" do
    feature :lala do |f|
      fail "this line should not be reached - 'feature' method should not yield at all"
    end
  end

  test "non-empty feature" do
    article = Factory.create :article
    article.feature_at! :top_spot
    
    feature :top_spot do |f|
      assert_equal article, f
    end
  end

end
