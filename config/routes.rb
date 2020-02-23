# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  devise_for :guests

  namespace :admin do
    get 'searches/index'
  end
  namespace :admin do
    resource :members, except:[:new,:create,:edit]
  end
  namespace :admin do
    resource :events, except:[:new,:create]
  end
  namespace :admin do
    resources :guests, except:[:new,:create]
  end
  root 'guest/homes#top'

  scope module: :guest do
    get 'searches/index'
  end
  scope module: :guest do
    resource :members, except:[:new,:edit]
  end
  scope module: :guest do
    resources :events
  end
  scope module: :guest do
    resource :guests, except:[:new,:create,:destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
