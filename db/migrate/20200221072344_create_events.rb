class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :guest_id
      t.integer :eventmember_id
      t.integer :genre_id
      t.string :title, null: false
      t.text :comment
      t.datetime :start_time, null: false
      t.datetime :finish_time

      t.timestamps
    end
  end
end
