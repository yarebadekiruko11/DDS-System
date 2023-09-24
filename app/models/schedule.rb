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

  # def validate(record)
    # if class_day < Time.zone.today
      # flash.now[:notise] = "今日以降の日付を選択してください"
    # elsif Schedule.where(:class_dayが同じかつ:class_timeが同じ, :instructor_idも同じ).present?
      # flash.now[:notice] = "別の指導員を選択してください"
    # elsif Schedule.where(:class_dayが同じかつ:class_timeが同じ, :course_idも同じ).present?
      # flash.now[:notice] = "別の生徒を選択してください"
    # else
      # schedule.save
      # flash.now[:notice] = "予約できました"
    # end

  # end

def class_day_validate
 if class_day.presence? && class_day <= Time.zone.today
   errors.add(:class_day, "明日以降の日付を登録してください")
 end
end




end
