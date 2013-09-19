Rvine::Application.routes.draw do

  resources :vines do
    member do
      put :upvote
    end
  end

  match '/auth/twitter/callback', :to => 'sessions#create'

  resource :dashboard
  root :to => 'dashboards#show'

end
