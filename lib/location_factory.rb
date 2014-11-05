class LocationFactory
  def initialize(country)
    @country = country
  end
  def create_location(location_name)
    @country.locations.create(name: location_name, external_id: RandomGenerator.generate_random_id, secret_code: RandomGenerator.generate_secret_code)
  end
end