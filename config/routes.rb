Rails.application.routes.draw do
  get "/" => 'static_pages#index'
  get "/form/respondents_details" => 'form#respondents_details'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
