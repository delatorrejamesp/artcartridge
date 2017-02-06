class AddColumnPhotosDescription < ActiveRecord::Migration[5.0]
  def change
   add_column :photos, :description, :text, after: :user_id
  end
end
