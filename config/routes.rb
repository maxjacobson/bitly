Bitly::Application.routes.draw do
  root to: 'links#index'
  get '/:link_uid' => 'links#short_link', as: 'short_link'
  resources :links, only: [:new, :create]
end
