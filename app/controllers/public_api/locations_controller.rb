module PublicApi
  class LocationsController < ApplicationController
    respond_to :json

    def by_country
      country_code = params[:country_code]
      locations = CountryLocationsService.new(country_code).get_locations_through_provider
      if locations
        respond_with(locations, status: 200)
      else
        respond_with(nil, status: :not_found)
      end
    end
  end
end