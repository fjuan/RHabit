class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

    def not_found
      redirect_to root_path(date: I18n.l(Date.today)), alert: t('flash_message.error.not_found')
    end
end
