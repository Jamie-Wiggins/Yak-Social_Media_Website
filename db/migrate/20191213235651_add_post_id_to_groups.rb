class AddPostIdToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :post_id, :integer
  end
end
