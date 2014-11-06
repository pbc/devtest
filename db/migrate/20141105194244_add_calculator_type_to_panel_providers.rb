class AddCalculatorTypeToPanelProviders < ActiveRecord::Migration
  def change
    add_column(:panel_providers, :price_calculator, :integer, default: 0)
  end
end
