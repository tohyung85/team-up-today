class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :require_authorization_for_action, only: [:edit, :update]

  def show
    @profile = user_of_profile.profile
  end

  def edit
    @profile = user_of_profile.profile
    @profile.user_work_samples.build if @profile.user_work_samples.empty?
  end

  def update
    profile_update_input = profile_params
    user_of_profile.profile.update_attributes(profile_update_input)
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
    update_language_database(params[:profile][:languages_attributes])
    update_skill_database(params[:profile][:skills_attributes])
    params.require(:profile).permit(:first_name, :last_name, :avatar, :website, :group_type_interests, :description, languages_attributes: [:id, :name, :_destroy], skills_attributes: [:id, :name, :_destroy], user_work_samples_attributes: [:id, :title, :_destroy])
  end

  def update_language_database(attributes)
    all_lang_arr = AllLanguage.all.map(&:name)
    attributes.each do |_key, attribute|
      AllLanguage.create(name: attribute['name']) unless all_lang_arr.include?(attribute['name'])
    end
  end

  def update_skill_database(attributes)
    all_skill_arr = AllSkill.all.map(&:name)
    attributes.each do |_key, attribute|
      AllSkill.create(name: attribute['name']) unless all_skill_arr.include?(attribute['name'])
    end
  end
end
