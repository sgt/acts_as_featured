class Feature < ActiveRecord::Base
  validates_presence_of :name, :featured
  validates_uniqueness_of :name
  belongs_to :featured, :polymorphic => true
end
