class ApplicationController < ActionController::Base
    helper_method :current_user
    
    private

    #метод возвращает пользователя, если он вошел на сайт через форму входа, nil, если это анонимный пользователь
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
end
