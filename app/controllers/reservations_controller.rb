class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def confirm
    @reservation = Reservation.new(params.permit(:reservation_start, :reservation_end, :reservation_people, :reservation_price, :room_id, :user_id))
    @room = Room.find(params[:room_id])
    @user_id = current_user.id
    @days = (@reservation.reservation_end - @reservation.reservation_start).to_i
    @price = @days * @room.room_price * @reservation.reservation_people
  end

  def create
    binding.pry
    @reservation = Reservation.new(params.require(:reservation).permit(:reservation_start, :reservation_end, :reservation_price, :reservation_people, :room_id, :user_id))
    if @reservation.save
      redirect_to @reservation
    else
      render "confirm"
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end
end
