class AddAvailabilityCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :availabilities_count, :integer
  end
end
