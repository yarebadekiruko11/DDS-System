class Admin::InstructorsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @instructors = Instructor.page(params[:page])
  end

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(instructor_params)
    if @instructor.save
      flash.now[:notice] = "登録しました"
     redirect_to admin_instructor_path(@instructor.id)
    else
      flash.now[:notice] = "入力してください"
     render :new
    end

  end

  def show
    @instructor = Instructor.find(params[:id])
    @schedules = @instructor.schedules.page(params[:page]).per(8).order(class_day: "DESC")
    @instructorcourses = @instructor.courses.page(params[:page]).per(4).order(start_time: "DESC")
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    instructor = Instructor.find(params[:id])
    if instructor.update(instructor_params)
     redirect_to admin_instructor_path(instructor.id)
    else
      flash.now[:notice] = "入力してください"
      render :edit
    end
  end

  private

  def instructor_params
    params.require(:instructor).permit(:name, :password, :password_confirmation, :email, :is_deleted)
  end

end
