class Instructor::CommentsController < ApplicationController

  def create
    course = Course.find(params[:course_id])
    comment = current_instructor.comments.new(comment_params)
    comment.course_id = course.id
    comment.save
    redirect_to course_path(course)
  end

  private

  def comment_params
    params.require(:comment).permit(:instructor_id, :course_id, :comment_body, :howmany)
  end



end
