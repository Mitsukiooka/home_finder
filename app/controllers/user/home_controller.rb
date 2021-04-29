class User::HomeController < User::ApplicationController
  def index
    @applications = current_user.applications
  end
end