class Instructor::StudentsController < ApplicationController

  def search
    # 入力情報
    @content = params[:content]
    # 検索実行
    @records = Student.search_for(@content)
  end
end
