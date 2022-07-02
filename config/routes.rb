Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      defaults format: :json do
        resources :campaigns do 
          get 'page/:page', action: :index, on: :collection
          resources :investments do
          end
        end
      end
    end
  end
end
