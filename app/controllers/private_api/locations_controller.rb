module PrivateApi
  class LocationsController < BaseLocationsController
    include PrivateApiAuthentication
  end
end