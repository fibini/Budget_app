class RenameUserWithAuthor < ActiveRecord::Migration[7.0]
  def change
    rename_column :entities, :user_id, :author_id
  end
end
