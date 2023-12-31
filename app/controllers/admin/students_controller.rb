class Admin::StudentsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @students = Student.page(params[:page])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to admin_student_path(@student.id)
    else
      flash.now[:notice] = "入力されていない項目があります"
      render :new
    end
  end

  def show
    @student = Student.find(params[:id])
    @course = Course.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to admin_students_path(@student.id)
    else
      flash.now[:notice] = "入力されていない項目があります"
      render :edit
    end
  end

  private

  # ストロングパラメータ
  def student_params
    params.require(:student).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :birthday, :phone)
  end


end
