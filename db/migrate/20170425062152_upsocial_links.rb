class UpsocialLinks < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :ig_link, :string, default: 'https://www.instagram.com'  
  end
end
