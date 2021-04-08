class RenameColumnsToFollow < ActiveRecord::Migration[5.2]
  def change
    rename_column :follows, :following_id, :followed_id
  end
end
