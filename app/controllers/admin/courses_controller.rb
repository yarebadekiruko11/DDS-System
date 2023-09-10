class Admin::CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def day_index
    if params[:start_time]
    # 文字列で送られたパラメータをdatetimeクラスに変換
    @start_time = params[:start_time].to_datetime

    # @courses = Course.where("start_time >= ? AND start_time <= ?", start_time.beginning_of_day, start_time.end_of_day)
    @courses = Course.where(start_time: @start_time.all_day)
    # @courses = Course.where(start_time: params[:id])
    else
      @graduation_day = params[:graduation_day].to_datetime
      @courses = Course.where(graduation_day: @graduation_day.all_day)
    end


  end

  def create
    @course = Course.new(course_params)
    if @course.save!
      redirect_to admin_course_path(@course.id)
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    # graduation_at = params[:graduation_at].to_datetime
    course = Course.find(params[:id])
    course.update(course_params)
    redirect_to admin_course_path(course.id)
  end

  def show
    @course = Course.find(params[:id])
  end

  def search

    if params[:car_model] == "standard"
      @courses = Course.where(car_model: 0)
      @keyword = params[:keyword]
    elsif params[:car_model] == "bike"
      @courses = Course.where(car_model: 1)
      @keyword = params[:keyword]
    else
      @courses = Course.where(car_model: 2)
      @keyword = params[:keyword]
    end

  end

  private

  # ストロングパラメータ
  def student_params
    params.require(:student).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :birthday, :phone)
  end

  def course_params
    params.require(:course).permit(:student_id, :start_time, :car_model, :status, :graduation_day, :instructor_id)
  end




end
