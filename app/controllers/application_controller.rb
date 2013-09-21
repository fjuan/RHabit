class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

    def not_found
      redirect_to root_path(date: I18n.l(Date.today)), alert: t('flash_message.error.not_found')
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:account_update) do |u| 
        u.permit(
          :email,
          :password,
          :password_confirmation,
          :current_password,
          :use_challenges,
          :use_chronicles,
          :use_meals,
          :use_payments,
          :use_workouts
        )
      end
    end
end
