class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def confirm
    @reservation = Reservation.new(params.permit(:reservation_start, :reservation_end, :reservation_people, :reservation_price, :room_id, :user_id))
    @room = Room.find(params[:room_id])
    @days = (@reservation.reservation_end - @reservation.reservation_start).to_i
    @price = @days * @room.room_price * @reservation.reservation_people

    if @days <= 0
      flash[:alert] = "終了日は開始日より後にしてください"
      redirect_to @room 
  
      elsif @reservation.reservation_people <=0 
        flash[:alert] = "正しい人数を入力してください"
        redirect_to @room
    end
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:reservation_start, :reservation_end, :reservation_price, :reservation_people, :room_id, :user_id))
    @room = Room.find(params[:reservation][:room_id])
    if @reservation.save
      flash[:notice] = "Reservation was successfully created."
      redirect_to @reservation
    else
      render "confirm"
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @room = @reservation.room
  end
end
