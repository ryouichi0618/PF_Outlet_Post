Rails.application.routes.draw do

  devise_for :admin, :controllers => {
    :sessions => 'admin/sessions'
  }
  devise_for :customers, :controllers => {
    :registrations => 'public/registrations',
    :sessions => 'public/sessions',
    :omniauth_callbacks => 'public/omniauth_callbacks'
  }

  scope module: :public do
    root to: 'posts#index'
    get '/search' => 'search#search'
    get '/about' => 'homes#about'
    get '/contact' => 'homes#contact'
    get '/contact/:id' => 'homes#contact_show', as: :contact_show



    resources :posts, except: [:edit, :index] do
      resources :post_ansewers, except: [:index,:new,:show]
      resource :favorites, only: [:create, :destroy]
    end

    get '/best_ansewr_ranking' => 'best_ansewers#ranks_all'
    get '/best_ansewr_ranking_week' => 'best_ansewers#ranks_week'

    resources :customers, except: [:new, :create, :index] do
      member do
        get 'unsubscribe'
        patch 'withdraw'
        get 'ansewers'
        get 'post_index'
      end
    end
  end

  namespace :admin do
    patch '/customers/:id/withdraw' => 'customers#withdraw'
    get '/search' => 'search#search'
    resources :customers, only: [:index, :show, :edit, :update]


    resources :posts, only: [:index, :show, :destroy] do
      resources :post_ansewers, only: [:destroy]
    end

    resources :contact, except: [:new]
  end

end
