Rails.application.routes.draw do

  # 管理者用
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # 指導員用
  devise_for :instructors, controllers: {
    sessions: "instructore/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
