class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :require_authorization_for_action, only: [:edit, :update]

  def show
    @profile = user_of_profile.profile
  end

  def edit
    @profile = user_of_profile.profile
  end

  def update
    user_of_profile.profile.update_attributes(profile_params)
    puts user_of_profile.profile.id
    redirect_to profile_path(user_of_profile.profile.id)
  end

  private

  def user_of_profile
    @user ||= Profile.find(params[:id]).user
  end

  def require_authorization_for_action
    return render_not_found(:unauthorized) unless current_user == user_of_profile
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :avatar)
  end
end
