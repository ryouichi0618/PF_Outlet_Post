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

    get '/about' => 'homes#about'
    get '/notice' => 'homes#notice'
    get '/notice/:id' => 'homes#notice_show'

    resources :posts, except: [:edit, :index] do
      resources :post_ansewers, except: [:index,:new,:show] do
        member do
          patch 'best'
        end
      end
      resource :favorites, only: [:create, :destroy]
    end

    get '/best_ansewr_ranking' => 'best_ansewers#index'

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
    get '/customers' => 'customers#top'
    get 'customers/:id' => 'customers#show'
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw'

    resources :posts, only: [:index, :show, :destroy]

    resources :notice, except: [:new, :create]
  end

end
