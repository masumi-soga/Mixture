class AddFileToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :file, :string
  end
end
