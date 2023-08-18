Rails.application.routes.draw do

  namespace :instructor do
    get 'comments/new'
    get 'comments/create'
    get 'comments/destroy'
    get 'comments/index'
  end
  namespace :instructor do
    get 'students/index'
    get 'students/show'
    get 'students/search'
  end
  namespace :admin do
    get 'students/index'
    get 'students/new'
    get 'students/create'
    get 'students/show'
    get 'students/edit'
    get 'students/update'
  end
  namespace :admin do
    get 'instructors/index'
    get 'instructors/new'
    get 'instructors/create'
    get 'instructors/show'
    get 'instructors/edit'
    get 'instructors/update'
  end
  # 管理者用
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  get 'admin/homes/top'


  # 指導員用
  devise_for :instructors, controllers: {
    sessions: "instructor/sessions"
  }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


 end
