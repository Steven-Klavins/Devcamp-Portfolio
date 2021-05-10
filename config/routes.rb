Rails.application.routes.draw do

  resources :comments
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  # resources makes models available for crud actions everywhere 
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  resources :blogs do
    member do # Member is the keyword that you use whenever you want to add a custom route (in this case to toggle_status method) 
      get :toggle_status # Toggle post(post request is reccoment) calls toggle_status
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'pages#home' # root to: is the root of our website (it has no relitive url (localhose:300))
  #pages#home represents withing the pages directory point to the home view 


  #Here re re-routed the about page to localhost:3000/about 
  #Get the relitive url /about-me to direct to our about-me page. (We can name the relitive path anything, it doest have to be about-me)
  #similar to root above #pages#about represents withing the pages directory point to the about view 
  get 'about-me', to: 'pages#about'

   #The same again for contacts
   get 'contact', to: 'pages#contact'
   get 'tech-news', to: 'pages#tech_news'

end



