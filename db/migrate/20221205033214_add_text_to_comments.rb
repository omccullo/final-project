class AddTextToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :comment, :text
    remove_column :comments, :user_id
  end
end
