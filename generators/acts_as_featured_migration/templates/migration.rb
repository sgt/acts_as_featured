class ActsAsFeaturedMigration < ActiveRecord::Migration
  def self.up
    create_table :features do |t|
      t.string :name, :null=>false
      t.string :featured_id, :null=> false

      t.timestamps
    end
    
    add_index :features, :name
  end
  
  def self.down
    drop_table :features
  end
end
