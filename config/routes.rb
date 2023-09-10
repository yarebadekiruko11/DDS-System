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
    # 受講コース生徒
    get 'courses/index_all'
    resources :courses, only: [:index, :show] do
    # コメント関係
      resources :comments, only: [:create]
    end



    # 生徒関係
    get 'students/search'

  end

# 管理者側のroutes
  namespace :admin do

    # ホーム画面
    get 'homes/top'
    get 'homes/search'

    # 生徒関係
    resources :students, only: [:new, :create, :edit, :show, :update]
    get 'students/search'

    # コース登録
    get 'courses/day_index' => 'courses#day_index'
    get 'courses/search'
    resources :courses, only: [:create, :show, :edit, :index, :update]



    # 指導員登録
    resources :instructors

    # スケジュール
    resources :schedules

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end