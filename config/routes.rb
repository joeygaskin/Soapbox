Rails.application.routes.draw do
    root 'sessions#new'

    resources :users

    resources :sessions, only: [:new, :create, :destroy]

    scope ':username' do
    resources :posts, except: [:create] do
      resources :comments
      end
    end




    scope ':username' do
    resources :admin, only: [:index]
    end


    post '/:username/posts', to: 'posts#create', as: 'user_posts'
    get 'signup', to: 'users#new', as: 'signup'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    get '/:username/admin', to: 'admin#index', as: 'admin'



# Used in troubleshooting to see a list of Users
    get 'directory', to: 'users#index2', as: 'directory'

    get '/:username' => 'users#show', :constrain => { :username => /[a-zA-Z-]+/ }



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
