Rails.application.routes.draw do
  root 'home#index'
  post 'api/alexa' => 'api#alexa'
end
