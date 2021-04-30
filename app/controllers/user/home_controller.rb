class User::HomeController < User::ApplicationController
  def index
    @applications = current_user.applications if !current_user.applications.nil?
  end
end