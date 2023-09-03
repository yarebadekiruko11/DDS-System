class Admin::HomesController < ApplicationController
  def top
    @courses = Course.all
  end

  def search
    @students = Student.looks(params[:last_name])

    # @courses = Course.looks(params[:name])
    # @courses.student.name

  end


end
