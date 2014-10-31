class CreateTargetGroups < ActiveRecord::Migration
  def change
    create_table :target_groups do |t|
      t.string :name, :null => false, :default => ""
      t.integer :external_id
      t.integer :parent_id
      t.string :secret_code, :default => ""

      t.timestamps
    end
  end
end
