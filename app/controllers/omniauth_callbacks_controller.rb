class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      flash[:notice] = "Succesfully signed in through Github"
      sign_in(@user)
      redirect_to projects_path
    else
      flash[:alert] = "There was a problem signing in through Github"
      redirect_to signup_path
    end
  end
end