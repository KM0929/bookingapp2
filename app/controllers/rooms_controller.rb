class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_name, :room_introduction, :room_price, :room_address, :room_image, :user_id))
    if @room.save
      flash[:notice] = "Room was successfully created."
      redirect_to @room
    else
      flash[:alert] = "必須項目に入力してください"
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @user = @room.user
  end

  def search
    @rooms = Room.where('room_address LIKE ?', "%#{params[:room_address]}%").where('room_introduction LIKE ? OR room_name LIKE ?', "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    @numbers = @rooms.count
  end
end
