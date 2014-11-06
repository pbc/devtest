class CreateLocationGroupsLocations < ActiveRecord::Migration
  def change
    create_table :location_groups_locations, id: false do |t|
      t.integer :location_id
      t.integer :location_group_id
    end
  end
end
