class Admin::HomesController < ApplicationController
  before_action :set_beginning_of_week

  def top
    @courses = Course.all
    @allschedules = Schedule.all
    @schedules = Schedule.where("class_day >= ?", Time.zone.today).order(class_time: "ASC")
    # @schedules = Schedule.order("class_time")
    @beginning_of_month = Time.zone.now.beginning_of_month
    @end_of_month = Time.zone.now.end_of_month
    @beginning_end_month = @beginning_of_month..@end_of_month

    @startcourses = Course.where(start_time: @beginning_of_month..@end_of_month)
    @endcourses = Course.where(start_time: @beginning_of_month..@end_of_month)

  end

  def search
    @range = params[:range]

    if @range == "受講生徒"
       @students = Student.search(params[:keyword])
       @keyword = params[:keyword]

      @courses = []
      @students.each do |student|

        @courses.concat(student.courses)
      end
    else
       @instructors = Instructor.search(params[:keyword])
       @keyword = params[:keyword]
    end

  end

  private

  def set_beginning_of_week
   Date.beginning_of_week = :sunday
  end


end
