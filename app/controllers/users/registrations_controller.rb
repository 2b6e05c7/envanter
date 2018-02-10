module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_account_update_params, only: [:update]
    layout 'application', only: %i[edit update]

    def configure_account_update_params
      devise_parameter_sanitizer.permit(
        :account_update,
        keys: %i[first_name last_name locale]
      )
    end
  end
end
