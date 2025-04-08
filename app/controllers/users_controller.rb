class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:update]
  
  def profile
    @user = current_user
  end

  def account
    @user = current_user
  end

  def edit_profile
    @user = current_user
  end
  
  def edit_account
    @user = current_user
  end

  def update_profile
    if current_user.update(user_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to users_profile_path
    else
      flash[:failure] = "更新に失敗しました"
      render :edit_profile
    end
  end
  
  def update_account
    if current_user.update(user_params)
      bypass_sign_in(current_user)
      flash[:success] = "アカウント情報を更新しました"
      redirect_to users_account_path
    else
      flash[:failure] = "更新に失敗しました"
      render :edit_account
    end
  end
  
  private
  
  def set_user
    @user = current_user
  end
  
  def user_params
    params.require(:user).permit(:user_icon,:name,:email,:introduce,:password,:password_confirmation)
  end
end
