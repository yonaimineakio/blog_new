class SessionController < ApplicationController

  skip_before_action :login_required
  def new
  end


  def create

    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      if user.admin?
        redirect_to admin_users_path, info: '管理者としてログインしました。'
      else
        redirect_to posts_path, info: 'ログインしました。'
      end
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new
    end
  end

  def destroy
    reset_session
    flash.now[:info] = 'ログインアウトしました。'
    redirect_to login_path
  end

    private

    def session_params
      params.required(:session).permit(:email, :password)
    end

end
