Rails.application.routes.draw do
  root to: "landing_pages#index"
  
  namespace :api do
    
    namespace :v1 do
      resources :maps
    end
  end

end
