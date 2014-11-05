module PublicApi
  class TargetGroupsController < ApplicationController
    respond_to :json

    def by_country
      country_code = params[:country_code]
      target_groups = CountryTargetGroupsService.new(country_code).get_target_groups_through_provider
      if target_groups
        respond_with(target_groups, status: 200)
      else
        respond_with(nil, status: :not_found)
      end
    end
  end
end