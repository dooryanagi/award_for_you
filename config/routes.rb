Rails.application.routes.draw do

  # 会員
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    passwords: 'public/passwords',
    sessions: 'public/sessions'
  }

  # ゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in' => 'public/sessions#guest_sign_in'
  end

  scope module: :public do

    root :to =>'homes#top'
    get '/about' => 'homes#about'

    get 'users/my_page' => 'users#show', as: 'my_page'
    get 'users/information/edit' => 'users#edit', as: 'edit_information'
    patch 'users/information' => 'users#update', as: 'update_information'
    put 'users/information' => 'users#update'
    get 'users/unsubscribe' => 'users#unsubscribe'
    patch 'users/withdraw' => 'users#withdraw'

    # 検索機能
    get 'searchs/search'
    get 'searchs/search_by_keyword'

    resources :awards do
      # 拍手は１アワードに対して一つ→id不要
      resource :applause, only: [:destroy, :create]
    end
    resources :grand_prizes do
      resources :praises, only: [:destroy, :create]
      resources :waiting_events, only: [:new, :create, :destroy] do
        collection do
          get 'congratulations'
        end
      end
      resources :events, only: [:create] do
        collection do
          post 'create_all'
        end
      end
    end
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
	    resources :praises, only: [:destroy, :create, :edit, :update]
	    resources :waiting_events, only: [:index]
      resources :events, only: [:index, :show, :destroy, :create]
	  end
  end

end