class Admin::CoursesController < ApplicationController
before_action :authenticate_admin!
  def index
    @courses = Course.page(params[:page]).order(start_time: "DESC")
  end

  def day_index
    if params[:start_time]
    # 文字列で送られたパラメータをdateクラスに変換
      @start_time = params[:start_time].to_date
      @courses = Course.where(start_time: @start_time.all_day).page(params[:page])

    else
      @graduation_day = params[:graduation_day].to_date
      @courses = Course.where(graduation_day: @graduation_day.all_day).page(params[:page])
    end
  end

  def create
    @course = Course.new(course_params)

    if Course.where(student_id: @course.student.id, car_model: @course.car_model).exists?
      flash[:notise] = "同じ車種で登録があります。別の車種を選択してください"
      @student = @course.student
      redirect_to admin_student_path(@student.id)
      return
    end

    if @course.save
      redirect_to admin_course_path(@course.id)
    else
      flash[:notise] = "入力漏れがあります"
      @student = @course.student
      redirect_to admin_student_path(@student.id)
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
     redirect_to admin_course_path(@course.id)
    else
     flash[:notise] = "入力漏れがあります"
     render :edit
    end
  end

  def show
    @course = Course.find(params[:id])
    @course_id = @course.id
    @schedules = @course.schedules.order(class_day: "DESC")

  end

  def search
    if params[:car_model] == "standard"
      @courses = Course.where(car_model: 0).page(params[:page])
      @keyword = "普通車"
    elsif params[:car_model] == "bike"
      @courses = Course.where(car_model: 1).page(params[:page])
      @keyword = "二輪"
    elsif params[:car_model] == "other"
      @courses = Course.where(car_model: 2).page(params[:page])
      @keyword = "その他"

    elsif params[:status] == "enrolled"
      @courses = Course.where(status: 0).page(params[:page])
      @keyword = "在籍"
    elsif params[:status] == "graduation"
      @courses = Course.where(status: 1).page(params[:page])
      @keyword = "卒業"
    else
      @courses = Course.where(status: 2).page(params[:page])
      @keyword = "退校"
    end
  end

  private

  # ストロングパラメータ
  def student_params
    params.require(:student).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :birthday, :phone)
  end

  def course_params
    params.require(:course).permit(:student_id, :start_time, :car_model, :status, :graduation_day, :instructor_id)
  end
end
