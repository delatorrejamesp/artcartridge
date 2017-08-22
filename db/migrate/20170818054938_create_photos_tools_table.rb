class CreatePhotosToolsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :photos_tools_tables do |t|
    end
    # This is enough; you don't need to worry about order
    #create_join_table :photos, :tools

    # If you want to add an index for faster querying through this join:
    create_join_table :photos, :tools do |t|
      t.index :photo_id
      t.index :tool_id
    end
  end
end
