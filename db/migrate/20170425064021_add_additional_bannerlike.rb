class AddAdditionalBannerlike < ActiveRecord::Migration[5.0]
  def change
      add_column :users, :shop_cover, :text, null: false, default: 'http://placehold.it/350x250'
      add_column :users, :portfolio_cover, :text, null: false, default: 'http://placehold.it/350x250'
      add_column :photos, :on_slide, :boolean, null: false, default: false
  end
end
