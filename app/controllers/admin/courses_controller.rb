class Admin::CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def create
    @course = Course.new(course_params)
    # @course.student_id = student.id

    if @course.save
      redirect_to admin_course_path(@course.id)
    else
      render :new
    end
  end

  def edit
  end

  def show
    @course = Course.find(params[:id])


  end

  private

  # ストロングパラメータ
  def student_params
    params.require(:student).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :birthday, :phone)
  end

  def course_params
    params.require(:course).permit(:student_id, :start_time, :car_model, :status, :graduation_at, :instructor_id)
  end




end
