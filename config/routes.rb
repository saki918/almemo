# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  devise_for :guests

  namespace :admin do
    resources :genres, only: %i[new index create destroy]
  end

  namespace :admin do
    get 'searches/event_index'
    get 'searches/member_index'
    get 'searches/guest_index'
  end

  namespace :admin do
    resources :guests, only: [:index]
  end

  root 'guest/homes#top'

  scope module: :guest do
    get 'searches/event_index'
    get 'searches/member_index'
  end

  scope module: :guest do
    resources :members, except: %i[new edit index]
  end

  scope module: :guest do
    resources :events do
      resources :eventmembers, only: [:create]
      get 'eventmembers/edit'
      delete :eventmembers, to: 'eventmembers#destroy_all'
      resources :images, only: [:create]
      get 'images/event_images_edit', as: 'images_edit'
      delete :images, to: 'images#destroy_all'
    end
  end

  scope module: :guest do
    resources :guests, except: %i[new create destroy index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
