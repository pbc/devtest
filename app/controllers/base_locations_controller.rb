class BaseLocationsController < ApplicationController
  respond_to :json

  def by_country
    country_code = params[:country_code]
    locations = CountryLocationsService.new(country_code).get_locations_through_provider
    if locations
      respond_with(locations, status: 200, location: nil)
    else
      respond_with(nil, status: :not_found, location: nil)
    end
  end
end