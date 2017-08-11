class SessionsController < ApplicationController

  def new
  end

  def create
    # binding.pry
    @user = User.find_by(:name => params[:name])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render '/signin'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
