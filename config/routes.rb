Rails.application.routes.draw do
  namespace :locale, path: '(:locale)', module: nil, as: nil, constraints: { locale: /cy/ } do
    scope :respond do
      resource :respondents_details, only: [:edit, :update], path_names: { edit: ''}
      resource :claimants_details, only: [:edit, :update], path_names: { edit: ''}
      resource :earnings_and_benefits, only: [:edit, :update], path_names: { edit: ''}
      resource :response, only: [:edit, :update], path_names: { edit: ''}
      resource :your_representative, only: [:edit, :update], path_names: { edit: ''}
      resource :your_representatives_details, only: [:edit, :update], path_names: { edit: ''}
      resource :disability, only: [:edit, :update], path_names: { edit: ''}
      resource :employers_contract_claim, only: [:edit, :update], path_names: { edit: ''}
      resource :additional_information, only: [:create, :edit, :update], path_names: { edit: ''}
      resource :confirmation_of_supplied_details, only: [:edit, :update], path_names: { edit: ''}
      get "form_submission", to: "form_submissions#index"
    end
    root 'static_pages#index'
    delete "/respond/confirmation_of_supplied_details/remove_rtf" => 'confirmation_of_supplied_details#destroy_rtf', as: :remove_rtf
    mount EtDropzoneUploader::Engine, at: '/api/v2/build_blob'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
  put "/" => 'static_pages#start_new_session', as: 'start_new_session'
  get "/session_expired" => 'static_pages#expired'
  get "/ping" => "status#ping"
  get "/healthcheck" => "status#healthcheck"
end
