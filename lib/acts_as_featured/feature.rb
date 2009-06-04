# The model for named feature spots.
class Feature < ActiveRecord::Base
  validates_presence_of :name, :featured
  validates_uniqueness_of :name
  belongs_to :featured, :polymorphic => true, :readonly => true
  
  # Return an object featured at the named spot, or nil if none.
  def self.object_featured_at(feature_name)
    feature = find_by_name(feature_name.to_s)
    feature.nil? ? nil : feature.featured
  end
  
  # Remove a feature entry.
  def self.remove_feature!(feature_name)
    destroy_all(:name => feature_name.to_s)
  end
end
