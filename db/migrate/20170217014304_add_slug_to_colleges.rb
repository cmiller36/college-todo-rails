class AddSlugToColleges < ActiveRecord::Migration[5.0]
  def change
    add_column :colleges, :slug, :string
    add_index :colleges, :slug, unique: true
  end
end
