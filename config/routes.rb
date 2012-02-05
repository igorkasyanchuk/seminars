EB5Seminar::Application.routes.draw do  
  namespace :admin do
    match '/', :to => 'dashboard#welcome'
    resources :speakers
    resources :sponsors
    resources :practice_areas
    resources :languages
    resources :pages
    resources :page_blocks
    resources :cities do
      resources :seminars
    end
    # make simpler routes
    resources :seminars, :only => [] do
      resources :documents
      resources :panels
    end
  end

  namespace :dashboard do
    resources :asset_photos, :except => [:destroy]
    resources :assets, :except => [:destroy]
  end   

  root :to => "home#index"

  match '/costs', :to => "home#costs"
  match '/costs/:city_id', :to => "home#costs", :as => :costs_city

  match '/venue', :to => "home#venue"
  
  match '/sponsors', :to => "home#sponsors"
  match '/sponsors/:city_id', :to => "home#sponsors", :as => :sponsors_city

  match '/resources', :to => "home#resources"
  match '/contact', :to => "home#contact"

  match '/about', :to => "home#about"

  match '/speakers', :to => "home#speakers"
  match '/agenda', :to => "home#agenda"

  resources :seminars do
    member do
      get :agenda
      get :speakers
      get :sponsors
      get :costs
    end
  end

  resources :cities

  match "/sitemap.xml", :controller => "home", :action => "sitemap", :format => 'xml'
end