class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  def index
    @rooms = Room.all
  end

  def show
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_path(@room.id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to room_path(@room.id)
    else
      render 'edit'
    end
  end

  def destroy
    @room.destroy
    redirect_to rooms_path
  end

  private
  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params[:room].permit(
      :name,
      :address,
      :rent,
      :nearest_station,
      :comment
    )
  end
end
