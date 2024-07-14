class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:return) || tests_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to login_path, notice: "You are logged out."
  end
end
