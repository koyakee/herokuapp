class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  
  def index
    @reservations = current_user.reservations
  end
  
  def confirm
    @reservation = current_user.reservations.build(reservation_params)
    @room = Room.find_by(id: @reservation.room_id)
    
    if @reservation.valid?
      render :confirm
    else
      flash[:failure] = "予約情報が不足しています"
      render :confirm
    end
  end
  
  def create
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save
      render :confirm
    else
      flash[:failure] = "予約情報が不足しています"
      render
    end
  end
  
  def update
    
  
  def destroy
    @reservation.destroy
    flash[:success] = "施設の予約情報を削除しました"
    redirect_to reservations_path
  end
  
  private
  
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end
  
    def reservation_params
      params.require(:reservation).permit(:checkInDate, :checkOutDate, :numberOfPeople, :room_id)
    end
  end
end
