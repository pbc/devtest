class CountryLocationsService
  def initialize(country_code)
    @country_code = country_code
  end

  def get_locations_through_provider
    country = Country.find_by_country_code(@country_code)
    country.panel_provider_unique_locations
  end
end