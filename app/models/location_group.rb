class LocationGroup < ActiveRecord::Base
  has_and_belongs_to_many :countries
  has_and_belongs_to_many :locations
end
