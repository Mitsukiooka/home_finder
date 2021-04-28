class User::RoomsController < User::ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  def index
    @rooms = Room.all.by_status
  end

  def show
  end

  private
  def set_room
    @room = Room.find(params[:id])
  end
end
