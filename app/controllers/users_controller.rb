class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user_dto = UserDTO.new(user_params)

    if user_dto.valid?
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      render json: user_dto.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end