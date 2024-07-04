Rails.application.routes.draw do

  namespace :public do
    get 'waiting_events/new'
  end
  namespace :public do
    get 'grand_prizes/new'
    get 'grand_prizes/index'
    get 'grand_prizes/show'
    get 'grand_prizes/edit'
  end
  namespace :public do
    get 'awards/new'
    get 'awards/index'
    get 'awards/show'
    get 'awards/edit'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/unsubscribe'
  end
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
          
    resources :awards      
    resources :applauses, only: [:destroy, :create]
    resources :grand_prizes
    resources :waiting_events, only: [:new, :create, :destroy]
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
    resources :event, only: [:index, :show, :destroy] 
    resources :praise, only: [:destroy, :create, :edit, :update]
  end

end