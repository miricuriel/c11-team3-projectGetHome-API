class SessionsController < ApplicationController
  skip_before_action :require_login!, only: :create

  def create
    user = User.authenticate(params[:email], params[:password])

    if user
      user.update_token
      render json: user, status: :ok
    else
      render_unauthorized("Invalid Credentials")
    end
  end

  def destroy
    current_user.invalidate_token
  end
end
