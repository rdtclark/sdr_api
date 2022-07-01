Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :campaigns do
        resources :investments do
        end
      end
      resources :investments do
      end
    end
  end
end
