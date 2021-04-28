class Owner::RoomsController < Owner::ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  def index
    @rooms = current_owner.rooms
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

  private
  def set_room
    @room = current_owner.rooms.find(params[:id])
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
      images:[]
    )
  end
end
