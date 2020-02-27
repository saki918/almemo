class AddIconIdToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :name, :string
    add_column :genres, :icon_id, :string
  end
end
