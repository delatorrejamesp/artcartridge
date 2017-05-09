class CreateAdminQoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_qoutes do |t|
      t.text :description
      t.boolean :enable

      t.timestamps
    end
  end
end
