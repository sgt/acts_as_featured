ActiveRecord::Schema.define do
  
  # Create two identical tables for articles and for posts.
  [:articles, :posts].each do |table_name|
    create_table table_name, :force => true do |t|
      t.string :subject
      t.text :body
      t.timestamps
    end
  end

end
