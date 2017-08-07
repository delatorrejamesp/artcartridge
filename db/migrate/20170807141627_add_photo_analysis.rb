class AddPhotoAnalysis < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :medium, :string
    add_column :photos, :gene, :string
    add_column :photos, :subject_matter, :string
  end
end
