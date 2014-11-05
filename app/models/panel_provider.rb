class PanelProvider < ActiveRecord::Base
  has_many :countries
  has_many :location_groups
  has_many :locations, through: :location_groups
  enum price_calculator: [
    :a_letters, 
    :b_openning_tags, 
    :html_nodes
  ]
end
