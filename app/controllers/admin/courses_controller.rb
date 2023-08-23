class Admin::CoursesController < ApplicationController

  def new
    @course = Course.new
    @student =Student.find(params[:id])
    


  end

  def edit
  end

  def show
  end
end
