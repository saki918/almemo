class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :refile_id
      t.integer :event_id
      t.integer :guest_id

      t.timestamps
    end
  end
end
