class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  layout :layout_by_resource
  before_action :authenticate_user!
  before_action :set_locale

  def set_locale
    I18n.locale = current_user.nil? ? I18n.default_locale : current_user.locale
  end

  private

  # TODO: Localization
  def user_not_authorized
    redirect_to(root_path, alert: 'Bu eylem için yetkili değilsiniz!')
  end

  def layout_by_resource
    return 'devise' if devise_controller?
    'application'
  end
end
