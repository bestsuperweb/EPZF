Rails.application.routes.draw do
  resources :posts
  get 'post/:id/pdf', to: 'posts#pdf',  as: 'pdf'
  get 'post/download', to: 'posts#download',  as: 'download'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'

end
