class CreateLocationGroups < ActiveRecord::Migration
  def change
    create_table :location_groups do |t|
      t.string :name, :null => false, :default => ""

      t.timestamps
    end
  end
end
