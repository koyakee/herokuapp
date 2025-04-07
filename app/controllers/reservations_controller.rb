class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def index
    @reservations = current_user.reservations.includes(:room)
  end
  
  def confirm
    @reservation = current_user.reservations.build(params.require(:reservation).permit(:checkInDate, :checkOutDate, :numberOfPeople, :room_id))
    @room = @reservation.room
    
    if @reservation.valid?
      render :confirm
    else
      flash[:failure] = "予約情報が不足しています"
      render :confirm
    end
  end
  
  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:checkInDate, :checkOutDate, :numberOfPeople, :room_id))
    @reservation.user = current_user
    @room = Room.find_by(id: @reservation.room_id)
    
    if @reservation.save
      flash[:success] = "予約が完了しました！"
      redirect_to reservations_path
    else
      flash[:failure] = "予約に失敗しました"
      render "rooms/show"
    end
  end
  
  def show
    @reservation = Reservation.find(params[:id])
  end
  
  def edit
    @room = @reservation.room
  end
  
  def update
    if @reservation.update(params.require(:reservation).permit(:checkInDate, :checkOutDate, :numberOfPeople, :room_id))
      flash[:success] = "予約を更新しました"
      redirect_to reservations_path
    else
      flash[:failure] = "予約情報が不足しています"
      render :edit
    end
  end
  
  def destroy
    @reservation.destroy
    flash[:success] = "施設の予約情報を削除しました"
    redirect_to reservations_path
  end
  
  private
  
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
