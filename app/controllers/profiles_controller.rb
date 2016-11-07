class ProfilesController < ApplicationController
  def show
    @profile = user_of_profile.profile
  end

  private

  def user_of_profile
    @user ||= User.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name)
  end
end
