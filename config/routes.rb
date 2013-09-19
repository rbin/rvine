Rvine::Application.routes.draw do

	resources :vines do
		member do
			put :upvote
		end
	end

	# root :to => 'welcome#index'

	match '/auth/twitter/callback', :to => 'sessions#create'
	
	resource :dashboard

	


end
