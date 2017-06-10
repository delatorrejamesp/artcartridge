class AddDefeultViewPhoto < ActiveRecord::Migration[5.0]
  def change
    change_column :photos, :views, :integer, default: 0
  end
end
