class SessionsController < ApplicationController
  helper_method :current_user
  def new
    if current_user
      redirect_to posts_url
    end
  end

  def create
    user = User.find_by_login_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user
      sign_in(user)
      #below link can be changed to our newsfeed index once we have
      redirect_to posts_url
    else
      flash.now[:errors] = ["Invalid username or password"]
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to new_session_url
  end
end