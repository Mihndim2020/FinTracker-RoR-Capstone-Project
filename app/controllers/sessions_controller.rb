class SessionsController < ApplicationController

  def new
  end

  def login
  end
 
  def create
    @user = User.find_by(name: params[:name])

    if @user
      session[:user_id] = @user.id
      flash[:notice] = "#{@user.name}, you logged in succesfully "
      redirect_to user_path(current_user)
    else
      flash[:alert] = 'Please Sign In or Sign Up if you don\'t have an account yet'
      redirect_to '/login'
    end
  end

  def destroy
    session.destroy
    flash[:notice] = 'You logged out successfully '
    redirect_to root_path
  end  
end
