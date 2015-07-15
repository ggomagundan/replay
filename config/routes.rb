Rails.application.routes.draw do

  root 'mains#index'

  resources :mains do
    get :get_video_url, on: :collection
  end

end
