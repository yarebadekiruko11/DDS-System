class Instructor::CommentsController < ApplicationController

  def create
    course = Course.find(params[:course_id])
    comment = current_instructor.comments.new(comment_params)
    comment.course_id = course.id
    if comment.save
      flash[:notice] = "コメントしました"
     redirect_to course_path(course)
    else
      flash[:notice] = "入力してください"
     redirect_to course_path(course)
    end
  end

  def index
    # 共通レイアウトスケジュール用
    @schedules = current_instructor.schedules
    @today_schedules = @schedules.where("class_day == ?", Time.zone.today).order(class_time: "ASC")

    course = Course.find(params[:course_id])
    @comments = course.comments.order(created_at: "DESC")
    @comments_top = "#{course.course_name}のコメント一覧"
  end

  def all_comments
    # 共通レイアウトスケジュール用
    @schedules = current_instructor.schedules
    @today_schedules = @schedules.where("class_day == ?", Time.zone.today).order(class_time: "ASC")

    @comments = current_instructor.comments.order(created_at: "DESC")
    @comments_top = "コメント履歴"
    render :index
  end

  private

  def comment_params
    params.require(:comment).permit(:instructor_id, :course_id, :comment_body, :howmany)
  end

end
