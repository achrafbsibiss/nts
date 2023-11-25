class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update destroy]
  before_action :set_breadcrumps, only: %i[create new edit update]
  before_action :set_edit_breadcrumps, only: %i[edit update]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page])
  end
  
  def show
  end 
  
  def new
    @user = User.new
    authorize!
    add_breadcrump(t("attributes.new"))
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
      redirect_to users_path, notice: 'User created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize! 
    if @user.update(user_params)
      redirect_to users_path, notice: t("flash.successfully_updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end 

  def destroy
    @user.destroy
    redirect_to users_path, notice: t("falsh.successfully_destroyed")
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_breadcrumps
    add_breadcrump("Agents", users_path)
  end

  def set_edit_breadcrumps
    add_breadcrump(@user.full_name, user_path(@user))
    add_breadcrump(t("attributes.edit_agent"))
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
      site_ids:[]
    )
  end
end
