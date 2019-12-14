class AddPostIdToReplies < ActiveRecord::Migration[5.2]
  def change
    add_column :replies, :post_id, :integer
  end
end
