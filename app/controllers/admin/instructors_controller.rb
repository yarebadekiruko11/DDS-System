class Admin::InstructorsController < ApplicationController
  def index
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
  end

  def edit
  end

  def update
  end

  private

  def instructor_params
    params.require(:instroctor).permit(:name, :passward)
  end



end
