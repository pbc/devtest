class PanelProvider < ActiveRecord::Base
  has_many :countries
  has_many :location_groups
  has_many :locations, through: :location_groups
end
