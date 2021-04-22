class RenameItemIdToNotifications < ActiveRecord::Migration[5.2]
  def change
    rename_column :notifications, :item_id, :post_content_id
  end
end
