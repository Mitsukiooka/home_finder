class User::RoomsController < User::ApplicationController
  before_action :set_room, except: [:index, :owner_show]
  def index
    @q = Room.includes(:owner).references(:owner).with_attached_outside_image.by_status.by_country(current_user.user_profile.country).page(params[:page]).per(6).ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end

  def show
    @application = Application.find_by(user_id: current_user.id, room_id: @room.id)
  end

  def application_new
    @application = current_user.applications.build
  end

  def application_create
    @application = current_user.applications.build(application_params)
    if @application.save
      ApplicationNoticeMailer.notice_mail(@room.owner, @application).deliver
      redirect_to application_sent_user_room_path(@room.id)
    else
      render 'application_new'
    end
  end

  def application_sent
  end

  def owner_show
    @owner = Owner.find(params[:owner_id])
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
