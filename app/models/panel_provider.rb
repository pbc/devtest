class PanelProvider < ActiveRecord::Base
  has_many :countries
  has_many :location_groups
  has_many :locations, through: :location_groups
  enum price_calculator: [
    :a_letters, 
    :b_openning_tags, 
    :html_nodes
  ]

  def calculate_price
    PanelProviderCalculatorFactory.price_calculator_for(self).calculate_price
  end
end
