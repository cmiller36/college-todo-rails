class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :destroy]
 
  def index
    @users = User.all
  end

  def show
    @colleges = current_user.colleges
  end

  def destroy
    session.clear if @user == current_user
    @user.destroy
    redirect_to request.referrer || root_path
  end



  private

  def set_user
    @user = User.friendly.find(params[:id])
  end

end