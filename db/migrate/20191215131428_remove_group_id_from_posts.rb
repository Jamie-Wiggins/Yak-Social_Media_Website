class RemoveGroupIdFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :group_id, :integer
  end
end
