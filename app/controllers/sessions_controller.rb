class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: user_params[:email])

    if @user&.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to home_path, notice: 'Thank you for signing in! ❤️'
    else
      flash.now[:alert] = 'Wrong credentials! 🚫'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_path, notice: 'Signed Out! 🏃'
  end

	def user_params
    params.require(:user).permit(
      :email,
      :password
    )
  end
end
