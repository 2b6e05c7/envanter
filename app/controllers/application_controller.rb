class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  include Pundit

  rescue_from(Pundit::NotAuthorizedError, with: :user_not_authorized)

  protect_from_forgery with: :exception

  layout :layout_by_resource

  before_action :authenticate_user! unless Rails.env.test?

  before_action :set_locale

  # Pundit policies disabled in test environment for now.
  def authorize(record, query = nil)
    return record if Rails.env.test?
    super
  end

  def set_locale
    I18n.locale = current_user.nil? ? I18n.default_locale : current_user.locale
  end

  private

  def user_not_authorized
    redirect_to(root_path, alert: t(:user_not_authorized))
  end

  def layout_by_resource
    if devise_controller?
      'devise'
    else
      'application'
    end
  end
end
