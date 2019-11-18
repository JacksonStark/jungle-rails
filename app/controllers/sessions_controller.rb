class SessionsController < ApplicationController

  def new
  end

  # def create
  #   user = User.find_by_email(params[:email])
  #   if user && user.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     redirect_to '/'
  #   else
  #     redirect_to '/login'
  #   end
  # end

  def create

    @user = User.authenticate_with_credentials(params[:email], params[:password])
    puts "USER: #{@user.inspect}"
    if @user
      # Save the user id inside the browser cookie to stay logged in
      session[:user_id] = @user.id
      redirect_to '/'
    else

      # If user's login doesn't work, show login form again
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
