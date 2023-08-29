class Admin::InstructorsController < ApplicationController
  def index
    @instructors = Instructor.all
  end

  def new
    @instructor = Instructor.new
  end

  def create
    instructor = Instructor.new(instructor_params)
    instructor.save
    redirect_to admin_instructor_path(instructor.id)
  end

  def show
    @instructor = Instructor.find(params[:id])
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    instructor = Instructor.find(params[:id])
    instructor.update(instructor_params)
    redirect_to admin_instructor_path(instructor.id)
  end

  private

  def instructor_params
    params.require(:instructor).permit(:name, :password, :password_confirmation, :email, :is_deleted)
  end



end
