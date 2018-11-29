class AddInviterOverlapCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :inviter_overlaps_count, :integer
  end
end
