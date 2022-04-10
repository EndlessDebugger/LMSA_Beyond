class HomeController < ApplicationController
  def index
    redirect_to(root_path) if request.path == '/home/adminDash' && !current_user.admin?
  end
end
