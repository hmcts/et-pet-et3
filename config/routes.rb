Rails.application.routes.draw do
  get "/" => 'static_pages#index'
  get "/form/respondents_details" => 'form#respondents_details'
  get "/form/claimants_details" => 'form#claimants_details'
  post "/form/respondents_details" => 'form#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
