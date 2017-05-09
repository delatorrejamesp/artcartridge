class AddColumnAuthorAdminQoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_qoutes, :authors, :string
  end
end
