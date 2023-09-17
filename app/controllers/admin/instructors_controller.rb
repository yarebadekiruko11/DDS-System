class Admin::InstructorsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @instructors = Instructor.all
  end

  def new
    @instructor = Instructor.new
  end

  def create
    instructor = Instructor.new(instructor_params)
    if instructor.save
    redirect_to admin_instructor_path(instructor.id)
    else
    render :new
    end
  end

  def show
    @instructor = Instructor.find(params[:id])
    @instructorcourses = @instructor.courses.page(params[:page]).per(5).order(start_time: "DESC")
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
