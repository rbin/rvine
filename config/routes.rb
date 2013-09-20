Rvine::Application.routes.draw do

	root :to => 'vines#index'

  resources :vines do
    member do
      put :upvote
    end
  end

  match '/auth/twitter/callback', :to => 'sessions#create'

  resource :dashboard

  root :to => 'vines#index'

end
