class RemovePostIdFromReplies < ActiveRecord::Migration[5.2]
  def change
    remove_column :replies, :post_id, :string
  end
end
