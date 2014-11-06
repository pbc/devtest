module PrivateApi
  class EvaluationsController < ApplicationController
    include PrivateApiAuthentication
    respond_to :json

    def evaluate_target
      country_code = params[:country_code]
      target_group_id = params[:target_group_id]
      locations = params[:locations]
      price = CountryPanelProviderPricingService.new(country_code).calculate_pricing_based_on_panel_provider
      if price
        respond_with({price: price}, status: 200, location: nil)
      else
        respond_with(nil, status: :not_found, location: nil)
      end
    end
  end
end