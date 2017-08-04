class AddPhotoOtherDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :social_description, :text
    add_column :photos, :professional_description, :text
    add_column :photos, :on_professional_page, :boolean, default: false
    add_column :photos, :same_description_on_professional_page, :boolean, default: false
    add_column :photos, :mature_content, :boolean, default: false
  end
end
