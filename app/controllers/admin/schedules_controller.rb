class Admin::SchedulesController < ApplicationController
  before_action :authenticate_admin!

  def new

    if params[:format].present?
     @class_day = params[:format].to_date
     @schedules = Schedule.where(class_day: @class_day.all_day).order(class_time: "ASC")
     @schedule = Schedule.new
    elsif params[:class_day].present?
     @class_day = params[:class_day].to_date
     @schedules = Schedule.where(class_day: @class_day.all_day).order(class_time: "ASC")
     @schedule = Schedule.new
    else
     @class_day = Time.zone.today
     @schedules = Schedule.where("class_day = ?", Time.zone.today).order(class_time: "ASC")
     @schedule = Schedule.new
    end
  end

  def create
    schedule = Schedule.new(schedule_params)

if schedule.class_day.present?

    if schedule.class_day < Time.zone.today
      flash[:notise] = "今日以降の日付を選択してください"
      redirect_to new_admin_schedule_path(schedule.class_day)
      return
    end
    if Schedule.where(class_day: schedule.class_day, class_time: schedule.class_time, instructor_id: schedule.instructor_id).exists?
      flash[:notise] = "別の指導員または別の時限を選択してください"
      redirect_to new_admin_schedule_path(schedule.class_day)
      return
    end
    if Schedule.where(class_day: schedule.class_day, class_time: schedule.class_time, course_id: schedule.course_id).exists?
      flash[:notise] = "別のコースを選択してください"
      redirect_to new_admin_schedule_path(schedule.class_day)
      return
    end

    if schedule.save
      redirect_to admin_schedule_path(schedule.id)
    else
      @class_day = Time.zone.today
      render new_admin_schedule_path
    end

else
  flash[:notise] = "予約日を選択してください"
  redirect_to new_admin_schedule_path(schedule.class_day)
  return
end

  end

  def edit
    @schedule = Schedule.find(params[:id])
    @class_day = @schedule.class_day
    @schedules = Schedule.where(class_day: @class_day.all_day).order(class_time: "ASC")

  end

  def update
      @schedule = Schedule.find(params[:id])
# データ比較のため仮保存
      @schedule.assign_attributes(schedule_params)

    if @schedule.class_day <= Time.zone.today
      flash[:notise] = "明日以降の日付を選択してください"
      redirect_to edit_admin_schedule_path(@schedule.id)
      return
    end
    if Schedule.where(class_day: @schedule.class_day, class_time: @schedule.class_time, instructor_id: @schedule.instructor_id).exists?
      flash[:notise] = "別の指導員または別の時限を選択してください"
      redirect_to edit_admin_schedule_path(@schedule.id)
      return
    end
    if Schedule.where(class_day: @schedule.class_day, class_time: @schedule.class_time, course_id: @schedule.course_id).exists?
      flash[:notise] = "別のコースを選択してください"
      redirect_to edit_admin_schedule_path(@schedule.id)
      return
    end

    if @schedule.update(schedule_params)
      redirect_to admin_schedule_path(@schedule.id)
    else
      render :edit
    end
  end

  def index
    @class_day = Time.zone.today
    @schedules = Schedule.where("class_day = ?", Time.zone.today).order(class_time: "ASC")
    @schedulesall = Schedule.all.order(class_day: "DESC", class_time: "DESC").page(params[:page])
  end

  def show
    @schedule = Schedule.find(params[:id])
    @class_day = @schedule.class_day
    @schedules = Schedule.where(class_day: @class_day.all_day).order(class_time: "ASC").page(params[:page])
  end

  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy
    redirect_to admin_homes_top_path
  end

  def dayplan
    # 文字列で送られたパラメータをdatetimeクラスに変換
    @class_day = params[:class_day].to_date
    @schedules = Schedule.where(class_day: @class_day.all_day).order(class_time: "ASC")

    # カレンダー使用コード
    @courses = Course.all

    # 各日スケジュール取得コード
    @allschedules = Schedule.all

    # 当月の入校・卒業数算出用コード
    @beginning_of_month = Time.zone.now.beginning_of_month
    @end_of_month = Time.zone.now.end_of_month
    @beginning_end_month = @beginning_of_month..@end_of_month

    @startcourses = Course.where(start_time: @beginning_of_month..@end_of_month)
    @endcourses = Course.where(start_time: @beginning_of_month..@end_of_month)

  end

  def instructorschedule
    @instructor = Instructor.find(params[:id])
    @schedules = @instructor.schedules.order(class_day: "DESC").page(params[:page])
  end


  private

  def schedule_params
    params.require(:schedule).permit(:course_id, :class_time, :class_day, :instructor_id)
  end

end
