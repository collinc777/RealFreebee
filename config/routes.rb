Rails.application.routes.draw do

  namespace :api, path: '/', constraints: { subdomain: 'api' } do
    namespace :v1 do
      resources :points, :users, except: [:new, :edit]
    end
  end

  # namespace path_helper hackery!
  get '/v1/points/:id', to: 'points#show', as: :point
  get '/v1/users/:id', to: 'users#show', as: :user

end
