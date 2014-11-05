#encoding: utf-8
require "random_generator"
require 'location_factory'
require 'target_group_factory'

ActiveRecord::Base.transaction do
  puts "Creating providers..."
  bra_provider = PanelProvider.create(code: "BRA")
  mex_provider = PanelProvider.create(code: "MEX")
  uk_provider = PanelProvider.create(code: "UK")

  puts "Creating countries..."
  bra = Country.create(country_code: "Brasil", panel_provider: bra_provider)
  mexico = Country.create(country_code: "Mexico", panel_provider: mex_provider)
  uk = Country.create(country_code: "United Kingdom", panel_provider: uk_provider)


  puts "Creating locations..."
  LocationFactory.new(bra).create_location("Itaipava")
  LocationFactory.new(bra).create_location("Correias")
  LocationFactory.new(bra).create_location("Petrópolis")
  LocationFactory.new(bra).create_location("Rio de Janeiro")
  LocationFactory.new(bra).create_location("São Paulo")
  LocationFactory.new(bra).create_location("Brasília")

  LocationFactory.new(mexico).create_location("Tijuana")
  LocationFactory.new(mexico).create_location("Guadalajara")
  LocationFactory.new(mexico).create_location("Ciudad de Mexico")
  LocationFactory.new(mexico).create_location("Tabasco")
  LocationFactory.new(mexico).create_location("Yucatan")

  LocationFactory.new(uk).create_location("Manchester")
  LocationFactory.new(uk).create_location("London")
  LocationFactory.new(uk).create_location("Bath")
  LocationFactory.new(uk).create_location("Birmingham")
  LocationFactory.new(uk).create_location("Liverpool")

  puts "Creating location groups..."
  bra_group_1 = LocationGroup.create(:panel_provider => bra_provider, name: "Brasil Group 1")
  bra_group_1.locations << bra.locations[0..2]
  bra_group_2 = LocationGroup.create(:panel_provider => bra_provider, name: "Brasil Group 2")
  bra_group_2.locations << bra.locations[3..5]
  mex_group = LocationGroup.create(:panel_provider => mex_provider, name: "Mexico Group")
  mex_group.locations << mexico.locations
  uk_group = LocationGroup.create(:panel_provider => uk_provider, name: "United Kingdom Group ")
  uk_group.locations << uk.locations

  puts "Creating target groups"
  TargetGroupFactory.new(bra, bra_provider).create_target_group_with("Television", {
      "Male" => {
        "20 to 30 years old" => {
          "Highschool Degree" => {}
        }
      }
    }
  )

  TargetGroupFactory.new(bra, bra_provider).create_target_group_with("Radio Streaming", {
      "Male" => {
        "30 to 40 years old" => {
          "Bsc. Degree" => {}
        }
      }
    }
  )  

  TargetGroupFactory.new(mexico, mex_provider).create_target_group_with("Radio Streaming", {
      "Female" => {
        "30 to 40 years old" => {
          "Masters Degree" => {}
        }
      }
    }
  )

  TargetGroupFactory.new(uk, uk_provider).create_target_group_with("Radio Streaming", {
      "Female" => {
        "10 to 20 years old" => {
          "PHD Degree" => {}
        }
      }
    }
  )
  
  #4 root Target Groups and each root should start a tree which is minimium 3 levels deep (3 of them with different provider and 1 would belong to any of them)
end