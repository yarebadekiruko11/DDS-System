Rails.application.routes.draw do


  # 管理者用devise
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # 指導員用devise
  devise_for :instructors, controllers: {
    registrations: 'instructor/registrations',
    sessions: "instructor/sessions"

  }
  devise_scope :instructor do
   root to: "instructor/sessions#new"
  end


# 指導員側のroutes
  scope module: :instructor do

    # 生徒関係
    resources :students, only: [:index, :show]
    get 'students/search'

    # コメント関係
    resources :comments, only: [:new, :create, :destroy, :index]

  end

# 管理者側のroutes
  namespace :admin do

    # ホーム画面
    get 'homes/top'

    # 生徒関係
    resources :students, only: [:new, :create, :edit, :show, :update]
    get 'students/search'

    # コース登録
    get 'courses/day_index' => 'courses#day_index'
    resources :courses, only: [:create, :show, :edit, :index, :update]


    # 指導員登録
    resources :instructors

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end