class Student < ApplicationRecord

      # アソシエーション
  has_many :courses, dependent: :destroy

end
