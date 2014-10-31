Devtest::Application.routes.draw do
  devise_for :users

  scope "/public" do
    get "locations/:country_code", :to => "locations#show_by_country",
      :as => :show_by_country
    get "target_groups/:country_code", :to => "target_groups#show_by_country",
      :as => :target_show_by_country
  end

  scope "/private" do
    get "locations/:country_code", :to => "locations#private_show_by_country",
      :as => :private_show_by_country
    get "target_groups/:country_code", :to => "target_groups#private_show_by_country",
      :as => :private_target_show_by_country

    post "evaluate_target", :to => "target_groups#evaluate_target",
      :as => :evaluate_target
  end

end
