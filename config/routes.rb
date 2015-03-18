Rails.application.routes.draw do
  root :to => 'links#index'

  resources :links do
    get '/downvote', to: 'links#downvote'
    resources :comments, :except => [:show, :index]
  end
end
