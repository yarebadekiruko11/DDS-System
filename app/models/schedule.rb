class Schedule < ApplicationRecord
  belongs_to :course
  belongs_to :instructor

  validates :course_id, presence: true
  validates :instructor_id, presence: true
  validates :class_time, presence: true
  validates :class_day, presence: true

  def class_dayf
    class_day.strftime('%m/%d')
  end

end
