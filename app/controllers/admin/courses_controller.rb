class Admin::CoursesController < ApplicationController

  def new

    @student =Student.find(params[:id])
    @course = Course.new
    @course.student.id = @student.id


  end

  def edit
  end

  def show
  end
end
