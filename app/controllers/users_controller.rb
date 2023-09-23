class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end
  
  def show
  end 
  
  def new
    @user = User.new
    authorize!
  end

  def edit
    authorize! 
  end

  def create
    @user = User.new(user_params)
    @user.password = Devise.friendly_token.first(8)
    authorize! 
    # @user.confirm

    if @user.save
      redirect_to root_path, notice: 'User created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize! 
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
      :nationality,
      :avatar,
      :site_id
    )
  end
end
