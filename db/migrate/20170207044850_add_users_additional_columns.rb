class AddUsersAdditionalColumns < ActiveRecord::Migration[5.0]
  def change
      add_column :users, :username, :string
      add_column :users, :first_name, :string
      add_column :users, :last_name, :string
      add_column :users, :address, :text
      add_column :users, :about_me, :text
      add_column :users, :birthday, :date, default: (Time.now - 18.years)
  end
end
