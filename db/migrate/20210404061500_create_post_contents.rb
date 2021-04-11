class CreatePostContents < ActiveRecord::Migration[5.2]
  def change
    create_table :post_contents do |t|
      t.integer :user_id
      t.string :title
      t.text :text
      t.string :music

      t.timestamps
    end
  end
end
