class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  helper_method :current_user
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_locale

  def set_locale
    I18n.locale = current_user.locale unless current_user.nil?
  end
end
