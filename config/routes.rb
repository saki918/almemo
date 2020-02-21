# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    get 'searches/index'
  end
  namespace :admin do
    get 'members/show'
    get 'members/edit'
  end
  namespace :admin do
    get 'events/show'
    get 'events/edit'
  end
  namespace :admin do
    get 'guests/show'
    get 'guests/edit'
    get 'guests/index'
  end
  root 'guest/homes#top'
  namespace :guest do
    get 'searches/index'
  end
  namespace :guest do
    get 'members/show'
  end
  namespace :guest do
    get 'events/show'
    get 'events/edit'
    get 'events/new'
    get 'events/index'
  end
  namespace :guest do
    get 'guests/show'
    get 'guests/edit'
  end
  devise_for :admins
  devise_for :guests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
