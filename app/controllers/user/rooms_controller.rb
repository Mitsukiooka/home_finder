class User::RoomsController < User::ApplicationController
  before_action :set_room, except: [:index]
  def index
    @rooms = Room.all.by_status
  end

  def show
  end

  def application_new
    @application = current_user.applications.build
  end

  def application_create
    @application = current_user.applications.build(application_params)
    if @application.save
      redirect_to application_sent_user_room_path(@room.id)
    else
      render 'application_new'
    end
  end

  def application_sent
  end

  private
  def set_room
    @room = Room.find(params[:id])
  end

  def application_params
    params[:application].permit(
      :room_id,
      :user_name,
      :user_email,
      :user_phone_number,
      :comment
    )
  end
end
