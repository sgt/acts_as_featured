class Test::Unit::TestCase
 
  def self.should_act_as_featured
    # TODO: a shoulda helper model_class should be here instead, but it doesn't work for me for some reason
    klass = self.get_model_class
  
    should_have_class_methods :acts_as_featured
    should_have_instance_methods :featured_at?, :featured_at, :fearure_at!
  end

  private
  def self.get_model_class
    self.name.gsub(/Test$/, '').constantize
  end
  
end
