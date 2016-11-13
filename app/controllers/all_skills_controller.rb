class AllSkillsController < ApplicationController
  respond_to :json
  def index
    skills = AllSkill.where(['name LIKE ?', "#{params[:input_string].capitalize}%"])
    @skill_arr = []
    skills.each do |skill|
      @skill_arr << skill.name
    end
    render json: { status: 'ok', skills: @skill_arr }
  end
end
