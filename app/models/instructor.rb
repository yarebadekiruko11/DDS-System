class Instructor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:name]

    # アソシエーション
  has_many :courses, dependent: :destroy
  has_many :comments, dependent: :destroy

  # 検索機能
  def self.looks(name)
    @instructor = Instructor.where("name LIKE?", "#{name}%")
  end


end
