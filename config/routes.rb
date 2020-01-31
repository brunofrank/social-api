Rails.application.routes.draw do
  namespace 'api' do
    post 'users' => 'users#create', as: :users_create
    post 'users/:user_id/follow/:id' => 'users#follow', as: :users_follow
    post 'users/:user_id/unfollow/:id' => 'users#unfollow', as: :users_unfollow
    get 'users/:user_id/followers' => 'users#followers', as: :users_followers
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
