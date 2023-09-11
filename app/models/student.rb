class Student < ApplicationRecord
 # アソシエーション
 has_many :courses, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true
  validates :address, presence: true
  validates :phone, presence: true


 def name
  last_name + first_name
 end
 def kana
  last_name_kana + first_name_kana
 end

 def self.search(keyword)
  Student.where("last_name LIKE ? OR first_name LIKE ? OR first_name_kana LIKE ? OR last_name_kana LIKE ? ", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%")
  # where(" LIKE ?", "%#{keyword}%")
  # Student.where('name LIKE ?' , content + '%')
 end


end
