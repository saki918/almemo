class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.integer :guest_id
      t.string :name, null: false
      t.timestamps
    end
  end
end
