module PublicApi
  class LocationsController < ApplicationController
    respond_to :json

    def by_country
      country_code = params[:country_code]
      locations = CountryLocationsService.new(country_code).get_locations_through_provider
      respond_with(locations.to_json)
    end
  end
end