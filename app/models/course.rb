class Course < ApplicationRecord

# アソシエーション
  belongs_to :student
  belongs_to :instructor
  has_many :comments, dependent: :destroy


end
