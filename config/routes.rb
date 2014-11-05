Rails.application.routes.draw do
  namespace :public_api do 
    get "locations/:country_code", to: "locations#by_country" 
  end

  namespace :private do 
     
  end
end