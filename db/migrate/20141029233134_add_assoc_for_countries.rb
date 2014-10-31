class AddAssocForCountries < ActiveRecord::Migration
  def up
    create_table :countries_location_groups do |t|
      t.integer :country_id
      t.integer :location_group_id
    end

    add_index :countries_location_groups, :country_id
    add_index :countries_location_groups, :location_group_id

    create_table :countries_target_groups do |t|
      t.integer :country_id
      t.integer :target_group_id
    end

    add_index :countries_target_groups, :country_id
    add_index :countries_target_groups, :target_group_id
  end

  def down
    drop_table :countries_location_groups
    drop_table :countries_target_groups
  end
end
