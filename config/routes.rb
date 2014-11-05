Rails.application.routes.draw do
  namespace :public_api do 
    get "locations/:country_code", to: "locations#by_country" 
    get "target_groups/:country_code", to: "target_groups#by_country"
  end

  namespace :private do
  end
end