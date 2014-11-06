class BaseTargetGroupsController < ApplicationController
  respond_to :json

  def by_country
    country_code = params[:country_code]
    target_groups = CountryTargetGroupsService.new(country_code).get_target_groups_through_provider
    if target_groups
      respond_with(target_groups, status: 200, location: nil)
    else
      respond_with(nil, status: :not_found, location: nil)
    end
  end
end