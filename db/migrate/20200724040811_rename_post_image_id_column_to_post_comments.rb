class RenamePostImageIdColumnToPostComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :post_comments, :post_image_id, :dog_id
  end
end