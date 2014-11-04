class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :external_id
      t.string :secret_code

      t.timestamps
    end
  end
end
