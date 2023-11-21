class ApplicationController < ActionController::Base
  
  helper_method :breadcrumps
  before_action :authenticate_user!, :set_locale
    
  def after_sign_in_path_for(resource)
    root_path
  end

  def breadcrumps
    @breadcrumps ||=[]
  end 

  def add_breadcrump(name, path = nil)
    breadcrumps << Breadcrump.new(name, path)
  end
  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    {locale: I18n.locale}.merge options
  end
end
