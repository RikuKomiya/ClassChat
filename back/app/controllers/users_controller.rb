class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    if current_user.update_attributes(user_params)
      render json: current_user, status: 200
    else 
      render json: current_user.error,status: :unprocessable_entity
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:university_id, :facluty_id,:name)
  end
end
