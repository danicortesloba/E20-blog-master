class PagesController < ApplicationController
  skip_authorize_resource
  skip_authorization_check

  def dashboard
    @user = current_user
    if user_signed_in? and @user.admin?
      @users = User.all
    else
      redirect_to root_path
    end
  end
private
  def user_params
     params.require(:user).permit(:id, :email, :name, :role)
   end
end
