class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_locale

  def set_locale
    I18n.locale = current_user.nil? ? I18n.default_locale : current_user.locale
  end
end
