class Admin::HomesController < ApplicationController
  def top
    @courses = Course.all
  end

end
