class Course < ApplicationRecord

# アソシエーション
  belongs_to :student
  belongs_to :instructor
  has_many :comments, dependent: :destroy

# enum定義
 enum status: { enrolled: 0, graduation: 1, leaving: 2 }
 
 def self.looks(name)
  
  @course = Course.where("course.student.name LIKE?", "#{name}%")
 end
 

end
