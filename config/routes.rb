Rails.application.routes.draw do
  scope :respond do
    resource :respondents_details, only: [:edit, :update], path_names: { edit: ''}
    resource :claimants_details, only: [:edit, :update], path_names: { edit: ''}
    resource :earnings_and_benefits, only: [:edit, :update], path_names: { edit: ''}
    resource :response, only: [:edit, :update], path_names: { edit: ''}
    resource :your_representative, only: [:edit, :update], path_names: { edit: ''}
    resource :your_representatives_details, only: [:edit, :update], path_names: { edit: ''}
    resource :employers_contract_claim, only: [:edit, :update], path_names: { edit: ''}
    resource :confirmation_of_supplied_details, only: [:edit, :update], path_names: { edit: ''}
    get "form_submission", to: "form_submissions#index"
  end
  get "/" => 'static_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
