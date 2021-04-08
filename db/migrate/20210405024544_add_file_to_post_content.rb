class AddFileToPostContent < ActiveRecord::Migration[5.2]
  def change
    add_column :post_contents, :file, :string
    remove_column :post_contents, :music, :string
  end
end
