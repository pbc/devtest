class CreateLocationGroups < ActiveRecord::Migration
  def change
    create_table :location_groups do |t|
      t.string :name
      t.integer :country_id
      t.integer :panel_provider_id

      t.timestamps
    end
  end
end
