class Admin::HomesController < ApplicationController
  before_action :set_beginning_of_week
  before_action :authenticate_admin!

  def top
    @class_day = Time.zone.today

    # カレンダー使用コード
    @courses = Course.all

    # 各日スケジュール取得コード
    @allschedules = Schedule.all

    # 当日スケジュール取得コード
    @schedules = Schedule.where("class_day == ?", Time.zone.today).order(class_time: "ASC")

    # 当月の入校・卒業数算出用コード
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
      # .order(start_time: :desc)
      @students.each do |student|
        @courses.concat(student.courses)
      end
    else
       @instructors = Instructor.search(params[:keyword])
       @keyword = params[:keyword]
    end

  end

  private

  # 日曜始まり
  # def set_beginning_of_week
  # Date.beginning_of_week = :sunday
  # end


end
