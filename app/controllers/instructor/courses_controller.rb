class Instructor::CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
    @comment = Comment.new

  end

  def index_all
    @courses = Course.all
  end

  def index
    @instructor = current_instructor
    @courses = @instructor.courses
  end
  
  
  
  
  
  
end
