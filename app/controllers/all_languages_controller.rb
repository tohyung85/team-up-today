class AllLanguagesController < ApplicationController
  respond_to :json
  def index
    languages = AllLanguage.where(['lower(name) LIKE ?', "#{params[:input_string].downcase}%"])
    @language_arr = []
    languages.each do |language|
      @language_arr << language.name
    end
    render json: { status: 'ok', languages: @language_arr }
  end
end
