class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:edit]
  before_action :require_authorization_for_action, only: [:edit]
  def show
    @profile = user_of_profile.profile
  end

  def edit
    @profile = user_of_profile.profile
  end

  private

  def user_of_profile
    @user ||= User.find(params[:id])
  end

  def require_authorization_for_action
    return render_not_found(:unauthorized) unless current_user == user_of_profile
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name)
  end
end
