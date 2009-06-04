require 'test_helper'

class FeatureTest < ActiveSupport::TestCase

  def setup
    reset_db!
  end

  test "validating mandatory fields presence" do
    article = Factory.create :article
    f = Feature.new(:name=>'foo', :featured => article)
    assert f.valid?
    f.featured = nil
    assert !f.valid?
    f.featured = article
    assert f.valid?
    f.name = nil
    assert !f.valid?
  end

  test "validating name uniqueness" do
    article = Factory.create :article
    feature1 = Feature.create(:name => 'foo', :featured => article)
    feature2 = Feature.new(:name => 'baz', :featured => article)
    assert feature2.valid?
    feature2.name = 'foo'
    assert !feature2.valid?
  end

end
