class Instructor::CoursesController < ApplicationController
  def show
    @instructor = current_instructor
    @schedules = @instructor.schedules
    @today_schedules = @schedules.where("class_day >= ?", Time.zone.today).order(class_time: "ASC")

    @course = Course.find(params[:id])
    # @course.comments = @course.comments.order(created_at: "DESC")
    @comment = Comment.new

  end

  # def index_all
    # @courses = Course.all
  # end

  def index
    @instructor = current_instructor
    @courses = @instructor.courses.page(params[:page])
    @schedules = @instructor.schedules
    @today_schedules = @schedules.where("class_day >= ?", Time.zone.today).order(class_time: "ASC")

  end

end
