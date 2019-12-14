class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content, null: false, default: ""
      t.string :color, default: "#e3e3e3"
      t.string :text_color, default: "#1f1f1f"
      t.string :font_type
      t.string :font_size

      t.timestamps
    end
  end
end
