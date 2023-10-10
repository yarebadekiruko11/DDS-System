class Instructor::SchedulesController < ApplicationController

  def index
    @course = Course.find(params[:course_id])
    @schedules = @course.schedules.order(created_at: "DESC").page(params[:page]).per(8)
    @comment = Comment.new
    @comments = @course.comments.order(created_at: "DESC").page(params[:page]).per(5)
  end

end
