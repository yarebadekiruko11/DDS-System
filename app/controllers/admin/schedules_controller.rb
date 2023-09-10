class Admin::SchedulesController < ApplicationController
  def new
    @schedules = Schedule.where("class_day >= ?", Time.zone.today)
    @schedule = Schedule.new
  end

  def create
    schedule = Schedule.new(schedule_params)
    if schedule.save
      redirect_to admin_homes_top_path
    else
      render new_admin_schedule_path
    end

  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    schedule = Schedule.find(params[:id])
    schedule.update(schedule_params)
    redirect_to admin_schedule_path(schedule.id)
  end

  def index
    @schedules = Schedule.all.order(class_day: "DESC", class_time: "DESC")
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy
    redirect_to admin_homes_top_path
  end

  private

  def schedule_params
    params.require(:schedule).permit(:course_id, :class_time, :class_day, :instructor_id)
  end

end
