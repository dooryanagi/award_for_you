Rails.application.routes.draw do

  # 会員
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    passwords: 'public/passwords',
    sessions: 'public/sessions'
  }

  scope module: :public do

    root :to =>'homes#top'
    get '/about' => 'homes#about'
    # 見本でどのように定義しているか確認（resourcesがないのでは？？）

    get 'users/my_page' => 'users#show', as: 'my_page'
    get 'users/information/edit' => 'users#edit', as: 'edit_information'
    patch 'users/information' => 'users#update', as: 'update_information'
    put 'users/information' => 'users#update'
    get 'users/unsubscribe' => 'users#unsubscribe'
    patch 'users/withdraw' => 'users#withdraw'

    # ゲストログイン
    post 'users/guest_sign_in' => 'users/sessions#guest_sign_in'

    resources :awards
    resource :applause, only: [:destroy, :create]
    resources :grand_prizes
    resources :waiting_events, only: [:new, :create, :destroy] do
      collection do
        get 'congratulations'
      end
    end
    resources :event, only: [:create]
    resources :praise, only: [:destroy, :create]

  end

  # 管理者
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
	   get '/' => 'homes#top'
	   resources :users, only: [:index, :show] do
	    collection do
        patch 'withdraw'
      end
    end
    resources :awards, only: [:index, :show, :destroy]
    resources :grand_prizes, except: [:index] do
	    collection do
	      post 'permit'
	      post 'permit_all'
	    end
	  end
	  resources :waiting_events, only: [:index]
    resources :events, only: [:index, :show, :destroy, :create]
    resources :praises, only: [:destroy, :create, :edit, :update]
  end

end