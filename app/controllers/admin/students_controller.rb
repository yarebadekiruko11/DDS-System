class Admin::StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    student = Student.new(student_params)
    student.save
    redirect_to admin_student_path(student.id)
  end

  def show
    @student = Student.find(params[:id])
    @course = Course.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    student = Student.find(params[:id])
    student.update(student_params)
    redirect_to admin_courses_path
  end

  private

  # ストロングパラメータ
  def student_params
    params.require(:student).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :birthday, :phone)
  end


end
