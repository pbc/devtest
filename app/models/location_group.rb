class LocationGroup < ActiveRecord::Base
  belongs_to :country
  belongs_to :panel_provider
end
