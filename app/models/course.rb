class Course < ApplicationRecord

# アソシエーション
  belongs_to :student
  belongs_to :instructor
  has_many :comments, dependent: :destroy

# enum定義

# 在籍ステータス
 enum status: { enrolled: 0, graduation: 1, leaving: 2 }
# 車種
 enum car_model: { standard: 0, bike: 1, other: 2 }

 def self.looks(name)
  @course = Course.where("course.student.name LIKE?", "#{name}%")
 end

 def howmany_select
        ['1段階-1','1-2','1-3','1-4','1-5','1-6','1-7','1-8','1-9','1-10','1-11以降',
        '2段階-1','2-2','2-3','2-4','2-5','2-6','2-7','2-8','2-9','2-10','2-11以降']
 end

end
