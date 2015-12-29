Railsgoat::Application.routes.draw do

  devise_for :users
 
  get "dashboard/doc" => "dashboard#doc"

  resources :sessions do
  end

  resources :users do
    get "account_settings"

    resources :retirement do
    end

    resources :paid_time_off do
    end

    resources :work_info do
    end

    resources :performance do

    end

    resources :benefit_forms do

    end

    resources :messages do
    end

    resources :pay do
      collection do
        post "update_dd_info"
        post "decrypted_bank_acct_num"
      end
    end

  end

  get "download" => "benefit_forms#download"
  post "upload" => "benefit_forms#upload"

  resources :tutorials do
    collection do
      get "credentials"
    end
  end

  resources :schedule do
    collection do
      get "get_pto_schedule"
    end

  end

  resources :admin do
    get "dashboard"
    get "get_user"
    post "delete_user"
    patch "update_user"
    get "get_all_users"
    get "analytics"
  end

  resources :dashboard do
    collection do
      get "home"
      get "change_graph"
    end
  end

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
        resources :users
        resources :mobile
    end
   end


  root :to => "dashboard#home"

end
