class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :email, :password)

    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: 'Вы зарегистрированы'
    else
      flash[:alert] = 'Вы неправильно заполнили поля формы регистрации'

      redirect_to new_user_path
    end
  end
end
