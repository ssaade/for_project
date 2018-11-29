class CreateOverlaps < ActiveRecord::Migration[5.1]
  def change
    create_table :overlaps do |t|
      t.integer :inviter_id
      t.integer :invited_id
      t.date :date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
