class Api::UsersController < ApplicationController
  before_action :load_user, except: %i[ create ]

  def create
    user = User.create(user_params)

    render json: UserSerializer.new(user).serialized_json
  end

  def follow
    user_to_follow = User.find(params[:id])
    @user.follow!(user_to_follow)

    render json: { message: :ok }
  end

  def unfollow
    user_to_unfollow = User.find(params[:id])
    @user.unfollow!(user_to_unfollow)

    render json: { message: :ok }
  end

  def followers
    render json: UserSerializer.new(@user.followers).serialized_json
  end

  private

  def user_params
    params.require(:user).permit(:name, :username)
  end

  def load_user
    @user = User.find(params[:user_id])
  end
end
