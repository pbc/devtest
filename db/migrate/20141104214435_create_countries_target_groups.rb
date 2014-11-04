class CreateCountriesTargetGroups < ActiveRecord::Migration
  def change
    create_table :countries_target_groups, id: false do |t|
      t.integer :country_id
      t.integer :target_group_id
    end
  end
end
