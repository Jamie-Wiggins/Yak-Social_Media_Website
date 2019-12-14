class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.text :reply, null: false, default: ""

      t.timestamps
    end
  end
end
