Rails.application.routes.draw do
  get 'updates/update'
  resources :item
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  patch "updates", to: "updates#update"
end
