class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update destroy]
  before_action :check_admin_privileges, only: %i[new create]
  
  def show
  end 
  
  def new
    puts "let start new user >>>>>>>>>>>"
    @user = User.new
    # authorize! @user
  end

  def edit
    # authorize! @user
  end

  def create
    puts ">>>>>>>>>>> let create new user"
    # authorize! @user
    @user = User.new(user_params)
    @user.password = Devise.friendly_token.first(8)
    # @user.confirm

    if @user.save
      redirect_to root_path, notice: 'User created successfully.'
    else
      render :new
    end
  end

  def update
    # authorize! @user
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: t("flash.successfully_updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end 

  private

  def check_admin_privileges
    unless current_user && current_user.admin?
      redirect_to root_path, alert: 'You do not have permission to create users.'
    end
  end

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
      :avatar
    )
  end
end
