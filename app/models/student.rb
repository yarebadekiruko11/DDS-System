class Student < ApplicationRecord

      # アソシエーション
  has_many :courses, dependent: :destroy

 def name
  last_name + first_name
 end
 def kana
  last_name_kana + first_name_kana
 end

end
