class CountryPanelProviderPricingService
  def initialize(country_code)
    @country_code = country_code
  end

  def calculate_pricing_based_on_panel_provider
    country = Country.find_by_country_code(@country_code)
    if country
      country.calculate_price_with_default_panel_provider
    end
  end
end