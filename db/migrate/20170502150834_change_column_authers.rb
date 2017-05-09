class ChangeColumnAuthers < ActiveRecord::Migration[5.0]
  def change
    rename_column :admin_qoutes, :authors, :author
  end
end
