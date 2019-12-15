class RemovePostIdFromGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :post_id, :integer
  end
end
