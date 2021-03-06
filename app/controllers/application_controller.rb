class ApplicationController < ActionController::Base
  
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    around_action :switch_locale

    def switch_locale(&action)
        locale = params[:locale] || I18n.default_locale
        I18n.with_locale(locale, &action)
    end

    def default_url_options
        { locale: I18n.locale }
    end

    protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) {
          |u| u.permit(:username, :email, :password)
        }
        devise_parameter_sanitizer.permit(:account_update) {
          |u| u.permit(:username, :email, :password, :current_password)
        }
      end
end
