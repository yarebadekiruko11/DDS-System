class Admin::HomesController < ApplicationController
  before_action :set_beginning_of_week

  def top
    @courses = Course.all
  end

  def search
    @students = Student.looks(params[:last_name])

    # @courses = Course.looks(params[:name])
    # @courses.student.name

  end

  private

  def set_beginning_of_week
   Date.beginning_of_week = :sunday
  end


end
