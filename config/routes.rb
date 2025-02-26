Rails.application.routes.draw do
  namespace :locale, path: '(:locale)', module: nil, as: nil, constraints: { locale: /en|cy/ } do
    devise_for :users, module: 'save_and_return', only: [:password, :session, :registration]
    scope :respond do
      resource :respondents_details, only: [:edit, :update], path_names: { edit: ''}
      resource :case_heard_by, only: [:edit, :update], path_names: { edit: ''}, controller: :case_heard_by
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

      resource :timeout_session, only: %i<destroy>, path: :session do
        member do
          get :touch
          get :expired
        end
      end
    end
    get "/terms" => 'static_pages#terms', as: 'terms_and_conditions'
    get "/privacy" => 'static_pages#privacy', as: 'privacy_notice'
    resource :cookies, only: %i<edit update create>, path_names: { edit: '/' }
    get "/session_expired" => 'static_pages#expired'
    root 'static_pages#index'
    delete "/respond/confirmation_of_supplied_details/remove_rtf" => 'confirmation_of_supplied_details#destroy_rtf', as: :remove_rtf
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
  put "/" => 'static_pages#start_new_session', as: 'start_new_session'

  get '/health' => 'status#healthcheck', defaults: { format: 'json' }
  get '/health/readiness' => 'status#healthcheck', defaults: { format: 'json' }
  get '/health/liveness' => 'status#healthcheck', defaults: { format: 'json' }
end
