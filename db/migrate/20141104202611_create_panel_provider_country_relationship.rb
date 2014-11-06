class CreatePanelProviderCountryRelationship < ActiveRecord::Migration
  def change
    add_column :countries, :panel_provider_id, :integer
  end
end
