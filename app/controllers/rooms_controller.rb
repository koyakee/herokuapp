class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    
    if params[:facility_address].present?
      @rooms = @rooms.where("facility_address LIKE ?", "%#{params[:facility_address]}%")
    end
    
    if params[:search_keyword].present?
      @rooms = @rooms.where("facility_name LIKE ? OR facility_address LIKE ?", "%#{params[:search_keyword]}%", "%#{params[:search_keyword]}%")
    end
  end
  
  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      flash[:success] = "施設情報が登録されました"
      redirect_to room_path(@room)
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      flash[:success] = "施設情報が更新されました"
      redirect_to room_path(@room)
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:success] = "施設情報を削除しました"
    redirect_to rooms_path
  end
  
  def own
    @rooms = current_user.rooms
  end
  
  private
  
  def room_params
    params.require(:room).permit(:facility_name, :facility_details, :facility_fee, :facility_address, :facility_images)
  end
end
