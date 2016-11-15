class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to user_path(current_user.id)
    end
  end

  def create
    @user = User.find_by(email: params[:session][:email])


    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
       flash[:notice] = "Could not find an user with provided username or password"
       redirect_to '/login'
    end
  end

  def destroy
    flash[:notice] = "You have successfully logged out"
    session.clear
    redirect_to '/'
  end

end
