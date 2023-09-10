class Admin::HomesController < ApplicationController
  before_action :set_beginning_of_week

  def top
    @courses = Course.all
    # @schedules = Schedule.where("class_day >= ?", Time.zone.today)
    @schedules = Schedule.order("class_time")
  end

  def search
    @range = params[:range]

    if @range == "受講生徒"
       @students = Student.search(params[:keyword])
       @keyword = params[:keyword]
      # pp "params[:word]------------------------------------------#{params[:word].class}"
      # pp "@students------------------------------------------#{@students.inspect}"
      # @courses = @students.courses
      @courses = []
      @students.each do |student|

        @courses.concat(student.courses)
      end
    else
       @instructors = Instructor.search(params[:keyword])
       @keyword = params[:keyword]
    end
    # @students = Student.looks(params[:last_name])

    # @courses = Course.looks(params[:name])
    # @courses.student.name

  end

  private

  def set_beginning_of_week
   Date.beginning_of_week = :sunday
  end


end
