class HomeController < ApplicationController


  def index
    if request.path == "/home/adminDash"
      redirect_to root_path unless current_user.admin?
    end
  end
end
