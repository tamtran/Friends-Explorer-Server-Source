class CreateCurrentUsersLocations < ActiveRecord::Migration
  def self.up
    create_table :current_users_locations do |t|
      t.string :name
      t.string :long
      t.string :lat

      t.timestamps
    end
  end

  def self.down
    drop_table :current_users_locations
  end
end
