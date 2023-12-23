class ApplicationController < ActionController::Base
    before_action :set_locale

  helper_method :current_user

  def change_language
    session[:locale] = params[:locale]
    redirect_back(fallback_location: root_path)
  end

  private

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end

    #метод возвращает пользователя, если он вошел на сайт через форму входа, nil, если это анонимный пользователь
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
end
