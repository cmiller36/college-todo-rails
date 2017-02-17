class AddSlugToTags < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :slug, :string
    add_index :tags, :slug, unique: true
  end
end
