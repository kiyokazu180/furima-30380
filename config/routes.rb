Rails.application.routes.draw do
  devise_for :users
  post "/items/:id/edit" => "items#update"
  root to: "items#index"
  resources  :items
end
