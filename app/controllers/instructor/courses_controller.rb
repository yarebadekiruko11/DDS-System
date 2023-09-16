class Instructor::CoursesController < ApplicationController
  def show
    # 共通レイアウト用
    @instructor = current_instructor
    @schedules = @instructor.schedules
    @today_schedules = @schedules.where("class_day == ?", Time.zone.today).order(class_time: "ASC")

    # コース詳細
    @course = Course.find(params[:id])
    @comment = Comment.new
    @comments = @course.comments.order(created_at: "DESC").page(params[:page]).per(5)

  end

  def index
    # 担当一覧表示
    @instructor = current_instructor
    @courses = @instructor.courses.page(params[:page]).order(start_time: "DESC")

    # 共通レイアウトスケジュール用
    @schedules = current_instructor.schedules
    @today_schedules = @schedules.where("class_day == ?", Time.zone.today).order(class_time: "ASC")

  end

end
