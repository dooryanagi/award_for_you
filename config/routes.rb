Rails.application.routes.draw do

  # deviseの会員
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
		passwords: 'public/passwords'
    sessions: 'public/sessions'
  }

  # deviseの管理者
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
	    sessions: "admin/sessions"
	}
  
  
  # 以下、要確認
  
	# devise以外
	# 会員
    scope module: :public do
      root :to =>'homes#top'
      get '/about' => 'homes#about'
      # 見本でどのように定義しているか確認（resourcesがないのでは？？）
      resources :users, only: [:show, :edit, :update] do
        collection do
	        get '/my_page' => 'users#show', as: 'my_page'
	        get '/information/edit' => 'users#edit', as: 'edit_information'
	        patch '/information' => 'users#update', as: 'update_information'
	        put '/information' => 'users#update'
          get 'unsubscribe'
          patch 'withdraw'
        end
      end
      resources :awards      
      resources :applauses, only: [:destroy, :create]
      resources :grand_prizes
      resources :waiting_events, only: [:new, :create, :destroy]
      resources :event, only: [:create]  
      resources :praise, only: [:destroy, :create]
    end

		# 管理者
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
      resources :event, only: [:index, :show, :destroy] 
      resources :praise, only: [:destroy, :create, :edit, :update]
    end

  end

  
  
  
end
