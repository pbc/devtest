class Country < ActiveRecord::Base
  belongs_to :panel_provider
  has_and_belongs_to_many :location_groups
end
