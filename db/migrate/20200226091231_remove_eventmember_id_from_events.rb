class RemoveEventmemberIdFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :eventmember_id, :integer
  end
end
