class AddAssocForLocations < ActiveRecord::Migration
  def up
    create_table :locations_location_groups do |t|
      t.integer :location_id
      t.integer :location_group_id
    end

    add_index :locations_location_groups, :location_id
    add_index :locations_location_groups, :location_group_id
  end

  def down
    drop_table :locations_location_groups
  end
end
