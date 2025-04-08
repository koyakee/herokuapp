class HomeController < ApplicationController
  def index
    @rooms = Room.all
    
    if params[:facility_address].present?
      @rooms = @rooms.where("facility_address LIKE ?", "%#{params[:facility_address]}%")
    end
  end
end
