require File.join( File.dirname(__FILE__), 'test_helper' )

class FeaturedTest < ActiveSupport::TestCase

  def setup
    reset_db!
  end
  
  test "refusing nil feature name" do
    article = Factory.create :article
    assert_raise(ArgumentError) { article.feature_at!(nil) }
  end
  
  test "adding feature" do
    article = Factory.create :article
    article.feature_at! :top_spot
    assert_equal ['top_spot'], article.featured_at
    assert article.featured_at?(:top_spot)
    assert_equal article, Feature.object_featured_at(:top_spot)
  end
  
  test "refusing to modify associated object" do
    article = Factory.create :article
    article.feature_at! :top_spot
    f = article.features[0]
    f.featured = nil
    assert !f.valid?
  end
  
  test "destroy dependency" do
    article = Factory.create :article
    article.feature_at! :top_spot
    article.destroy
    assert_nil Feature.find_by_name(:top_spot)
  end
  
  test "removing features" do
    article = Factory.create :article
    assert_nil Feature.object_featured_at(:top_spot)
    article.feature_at! :top_spot
    assert_equal article, Feature.object_featured_at(:top_spot)
    Feature.remove_feature! :top_spot
    assert_nil Feature.object_featured_at(:top_spot)
    assert !article.featured_at?(:top_spot)
    assert_equal 0, article.featured_at.size
  end
  
  test "adding multiple features" do
    article = Factory.create :article
    article.feature_at! :top_spot
    article.feature_at! :bottom_spot
    assert_equal 2, article.featured_at.size
    assert article.featured_at.include?(:top_spot.to_s)
    assert article.featured_at.include?(:bottom_spot.to_s)
    assert article.featured_at?(:top_spot)
    assert article.featured_at?(:bottom_spot)
    assert_equal article, Feature.object_featured_at(:top_spot)
    assert_equal article, Feature.object_featured_at(:bottom_spot)    
  end
  
  test "changing feature" do
    article = Factory.create :article
    post = Factory.create :post
    article.feature_at! :top_spot
    post.feature_at! :top_spot
    assert_equal [], article.featured_at
    assert !article.featured_at?(:top_spot)
    assert_equal post, Feature.object_featured_at(:top_spot)
    assert_equal ["top_spot"], post.featured_at
    assert post.featured_at?(:top_spot)
  end
end
