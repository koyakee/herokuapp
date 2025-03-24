class UsersController < ApplicationController
  def index
    @users = User.all
    @rooms = Room.all
    @reservations = Reservation.all
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end