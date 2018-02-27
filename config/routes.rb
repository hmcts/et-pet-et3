Rails.application.routes.draw do
  scope :respond do
    resource :respondents_details, only: [:edit, :update], path_names: { edit: ''}
    resource :claimants_details, only: [:edit, :update], path_names: { edit: ''}
    resource :earnings_and_benefits, only: [:edit, :update], path_names: { edit: ''}
    resource :response, only: [:edit, :update], path_names: { edit: ''}
    resource :your_representative, only: [:edit, :update], path_names: { edit: ''}
  end
  get "/" => 'static_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
