class ApplicationController < ActionController::Base

  private

  def set_beginning_of_week
   Date.beginning_of_week = :sunday
  end

end
