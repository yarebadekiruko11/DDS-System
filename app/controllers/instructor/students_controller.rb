class Instructor::StudentsController < ApplicationController

  def search
    # 入力情報
    @students = Student.search(params[:keyword])
    @keyword = params[:keyword]
    @courses = []
    @students.each do |student|
      @courses.concat(student.courses)
    end

  end
end
