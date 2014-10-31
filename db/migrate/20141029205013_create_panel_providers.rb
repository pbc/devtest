class CreatePanelProviders < ActiveRecord::Migration
  def change
    create_table :panel_providers do |t|
      t.string :code, :null => false, :default => ""

      t.timestamps
    end
  end
end
