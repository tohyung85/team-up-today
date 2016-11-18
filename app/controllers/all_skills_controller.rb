class AllSkillsController < ApplicationController
  respond_to :json
  def index
    skills = AllSkill.where(['lower(name) LIKE ?', "#{params[:input_string].downcase}%"])
    @skill_arr = []
    skills.each do |skill|
      @skill_arr << skill.name
    end
    render json: { status: 'ok', skills: @skill_arr }
  end
end
