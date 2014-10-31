class TargetGroupsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show_by_country]

  # GET /public/target_groups/:country_code
  def show_by_country
    @country = Country.find_by_country_code(params[:country_code])
    @target_groups = @country.target_groups

    respond_to do |format|
      format.html { render json: @target_groups }
    end
  end

  # GET /private/target_groups/:country_code
  def private_show_by_country
    show_by_country
  end

  # POST /evaluate_target/
  def evaluate_target
    @country = Country.find_by_country_code(params[:country_code])
    # @target_group = TargetGroup.find(params[:target_group_id])

    location_ids = params[:locations].map{ |item| item.values }.map{|item| item[0]}
    @locations = Location.where(:id => location_ids)

    price = @country.panel_provider.price

    respond_to do |format|
      format.html { render json: price }
    end
  end

end
