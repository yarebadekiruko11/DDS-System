class Admin::StudentsController < ApplicationController
  def index
  end

  def new
    @student = Student.new
  end

  def create
    student = Student.new(student_params)
    student.save
    redirect_to admin_course_new_path
  end

  def show
    @student =Student.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  # ストロングパラメータ
  def student_params
    params.require(:student).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :birthday, :phone)
  end


end
