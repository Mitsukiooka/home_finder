class Owner::RoomsController < Owner::ApplicationController
  before_action :set_room, except: [:index, :new, :create]
  before_action :set_application, only: [:application_show, :application_update]
  def index
    @rooms = current_owner.rooms.includes(:applications)
  end

  def show
  end

  def new
    @room = current_owner.rooms.build
  end

  def create
    @room = current_owner.rooms.build(room_params)
    if @room.save
      redirect_to owner_room_path(@room.id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to owner_room_path(@room.id)
    else
      render 'edit'
    end
  end

  def destroy
    @room.destroy
    redirect_to owner_rooms_path
  end

  def application_show
  end

  def application_update
    if @application.update(application_params)
      redirect_to owner_room_path(@room.id)
    else
      render 'application_show'
    end
  end

  private
  def set_room
    @room = current_owner.rooms.find(params[:id])
  end

  def set_application
    @application = @room.applications.find(params[:application_id])
  end

  def room_params
    params[:room].permit(
      :name,
      :address,
      :rent,
      :nearest_station,
      :comment,
      :status,
      :country,
      :outside_image,
      images:[]
    )
  end

  def application_params
    params[:application].permit(
      :status
    )
  end
end
