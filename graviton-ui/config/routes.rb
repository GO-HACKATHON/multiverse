Rails.application.routes.draw do
  root to: "landing_pages#index"
  get "/heatmap", to: "landing_pages#heatmap"
  
  namespace :api do
    
    namespace :v1 do
      resources :maps
    end
  end

end
