class V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors
    end
  end

  def index
    users = if params[:uid]
    User.find_by(uid: params[:uid])
   else
      User.all
   end
    render json: users
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :uid)
  end
end
