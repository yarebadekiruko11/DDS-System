class Instructor::StudentsController < ApplicationController

  def search
    @instructor = current_instructor
    @schedules = @instructor.schedules
    @today_schedules = @schedules.where("class_day = ?", Time.zone.today).order(class_time: "ASC")
    # 入力情報
    @students = Student.search(params[:keyword])
    @keyword = params[:keyword]
    @courses = []
    @students.each do |student|
     @courses.concat(student.courses)
    end

  end
end
