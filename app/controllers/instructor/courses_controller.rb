class Instructor::CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
    # @course.comments = @course.comments.order(created_at: :desc)
    @comment = Comment.new

  end

  def index_all
    @courses = Course.all
  end

  def index
    @instructor = current_instructor
    @courses = @instructor.courses
    @schedules = @instructor.schedules
    @today_schedules = @schedules.where("class_day >= ?", Time.zone.today)
  end






end
