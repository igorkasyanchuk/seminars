EB5Seminar::Application.routes.draw do  
  namespace :admin do
    match '/', :to => 'dashboard#welcome'
    match '/import', :to => 'dashboard#import', :as => :import
    match '/refresh', :to => 'dashboard#refresh', :as => :refresh
    resources :speakers do
      member {
        get :refresh
      }
    end
    resources :sponsors do
      member {
        get :refresh
      }
    end

    resources :medians

    resources :practice_areas
    resources :languages
    resources :testimonials
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
    resources :panels do
      resources :videos
      resources :photos
      resources :presentations
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
  match '/venue/:id', :to => "venue#venue", :as => :city_venue
  
  match '/sponsors', :to => "home#sponsors"
  resources :sponsors, :only => [:show]
  match '/sponsors/:city_id', :to => "home#sponsors", :as => :sponsors_city

  match '/resources', :to => "home#resources"
  match '/contact', :to => "home#contact"

  match '/testimonials', :to => "testimonials#index"

  match '/about', :to => "home#about"

  match '/search', :to => 'home#search'

  match '/speakers', :to => "home#speakers"
  resources :speakers, :only => [:show]

  resources :medians, :only => [:show]

  match '/cities/:id/speakers', :to => "cities#speakers", :as => :city_speakers
  match '/cities/:id/sponsors', :to => "cities#sponsors", :as => :city_sponsors

  match '/agenda', :to => "home#agenda"
  match '/agenda/:id', :to => "agenda#agenda"

  resources :seminars do
    member do
      get :agenda
      get :speakers
      get :sponsors
      get :costs
    end
  end

  resources :cities, :only => [:index, :show]

  match "/sitemap.xml", :controller => "home", :action => "sitemap", :format => 'xml'
end