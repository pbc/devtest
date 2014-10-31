class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :country_code, :null => false, :default => ""
      t.integer :panel_provider_id

      t.timestamps
    end
  end
end
