require File.join( File.dirname(__FILE__), 'test_helper' )

class FeaturedTest < ActiveSupport::TestCase
  
  include ActsAsFeaturedHelper
  
  def setup
    reset_db!
  end

  test "empty feature" do
    feature :lala do |f|
      assert_nil f
    end
  end

  test "empty feature with default value" do
    article = Factory(:article)
    feature :lala, article do |f|
      assert_equal article, f
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
