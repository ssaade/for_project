class CreateAvailabilities < ActiveRecord::Migration[5.1]
  def change
    create_table :availabilities do |t|
      t.integer :user_id
      t.datetime :date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
