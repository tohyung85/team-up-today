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
    group_interests_string = params[:profile][:group_type_interests].join(', ')
    params[:profile][:group_type_interests] = group_interests_string == '' ? group_interests_string : group_interests_string[0...-2]
    params.require(:profile).permit(:first_name, :last_name, :avatar, :group_type_interests)
  end
end
