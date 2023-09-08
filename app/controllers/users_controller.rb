class UsersController < ApplicationController

  before_action :set_user, only: %i[show edit update destroy]

  def show
  end 

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: t("flash.successfully_updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end 

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :birthdate,
      :gender,
      :cin,
      :phone,
      :job_title,
      :nationality
    )
  end
end
