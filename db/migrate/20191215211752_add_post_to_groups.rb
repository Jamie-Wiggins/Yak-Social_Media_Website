class AddPostToGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :groups, :post, foreign_key: true
  end
end
