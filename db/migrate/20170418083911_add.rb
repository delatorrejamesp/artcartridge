class Add < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :fb_link, :string, null: false, default: 'https://www.facebook.com/'
    add_column :users, :ig_link, :string, null: false, default: 'https://www.instagram.com'
    add_column :users, :twitter_link, :string, null: false, default: 'https://twitter.com/'
    add_column :users, :tumblr_link, :string, null: false, default: 'https://www.tumblr.com/'
    add_column :users, :banner, :text, null: false, default: 'https://placeholdit.imgix.net/~text?txtsize=33&txt=350%C3%97150&w=11700&h=200'
  end
end
