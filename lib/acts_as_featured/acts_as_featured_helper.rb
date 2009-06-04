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
    yield Feature.object_featured_at(feature_name)
  end
  
end
