class CreateCountriesLocationGroups < ActiveRecord::Migration
  def change
    create_table :countries_location_groups, id: false do |t|
      t.integer :country_id
      t.integer :location_group_id
    end
  end
end
