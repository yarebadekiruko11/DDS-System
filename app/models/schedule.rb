class Schedule < ApplicationRecord
  belongs_to :course
  belongs_to :instructor



  validates :course_id, presence: true
  validates :instructor_id, presence: true
  validates :class_time, presence: true



end
