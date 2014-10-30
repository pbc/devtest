class LocationsController < ApplicationController
  # before_filter :authenticate_user

  # GET /locations/:country_code.json
  def show_by_country
    @country = Country.find_by_country_code(params[:country_code])
    @locations = @country.locations

    respond_to do |format|
      format.json { render json: @locations }
    end
  end
end
