class DashboardController < ApplicationController
  def index
    @users = User.order(created_at: :desc).limit(5)
  end
end
