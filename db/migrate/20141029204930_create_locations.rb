class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, :null => false, :default => ""
      t.integer :external_id
      t.string :secret_code, :default => ""
      t.integer :country_id

      t.timestamps
    end
  end
end
