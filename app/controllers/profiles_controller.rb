class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:edit]
  def show
    @profile = user_of_profile.profile
  end

  def edit
  end

  private

  def user_of_profile
    @user ||= User.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name)
  end
end
