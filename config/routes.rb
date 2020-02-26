# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  devise_for :guests

  namespace :admin do
    get 'searches/index'
  end
  namespace :admin do
    resources :members, except:[:new,:create,:edit,:index]
  end
  namespace :admin do
    resources :events, except:[:new,:create,:index]
  end
  namespace :admin do
    resources :guests, except:[:new,:create]
  end
  root 'guest/homes#top'

  scope module: :guest do
    get 'searches/index'
  end
  scope module: :guest do
    resources :members, except:[:new,:edit,:index]
  end
  scope module: :guest do
    resources :events
  end
  scope module: :guest do
    resources :guests, except:[:new,:create,:destroy,:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
