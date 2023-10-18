class DashboardController < ApplicationController
  def index
    @users = User.order(created_at: :desc).limit(5)
    @sites = Site.all
  end
end
