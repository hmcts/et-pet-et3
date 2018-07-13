require 'api_proxy'
Rails.application.routes.draw do
  scope :respond do
    resource :respondents_details, only: [:edit, :update], path_names: { edit: ''}
    resource :claimants_details, only: [:edit, :update], path_names: { edit: ''}
    resource :earnings_and_benefits, only: [:edit, :update], path_names: { edit: ''}
    resource :response, only: [:edit, :update], path_names: { edit: ''}
    resource :your_representative, only: [:edit, :update], path_names: { edit: ''}
    resource :your_representatives_details, only: [:edit, :update], path_names: { edit: ''}
    resource :employers_contract_claim, only: [:edit, :update], path_names: { edit: ''}
    resource :additional_information, only: [:create, :edit, :update], path_names: { edit: ''}
    resource :confirmation_of_supplied_details, only: [:edit, :update], path_names: { edit: ''}
    get "form_submission", to: "form_submissions#index"
  end
  root 'static_pages#index'
  get "/session_expired" => 'static_pages#expired'
  mount ApiProxy.new(backend: "#{ENV.fetch('ET_API_URL', 'http://api.et.127.0.0.1.nip.io:3100/api')}/v2/s3/create_signed_url", streaming: false), at: "/api/s3/create_signed_url"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
