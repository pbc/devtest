class LocationsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show_by_country]

  # GET /public/locations/:country_code
  def show_by_country
    @country = Country.find_by_country_code(params[:country_code])
    @locations = @country.locations

    respond_to do |format|
      format.html { render json: @locations }
    end
  end

  # GET /private/locations/:country_code
  def private_show_by_country
    show_by_country
  end
end
