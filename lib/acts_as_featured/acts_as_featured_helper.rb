# View helpers for +acts_as_featured+.
#
# Usage:
#
#   <% feature :top_spot do |f| %>
#     <%= link_to f, f.name %>
#   <% end %>
#
module ActsAsFeaturedHelper
  
  # Pass the featured object to the block, if the object exists.
  def feature(feature_name, &block)
    object = Feature.object_featured_at(feature_name)
    yield object unless object.nil?
  end
  
end
