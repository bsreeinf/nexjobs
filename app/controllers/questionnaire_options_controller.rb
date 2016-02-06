class QuestionnaireOptionsController < ApplicationController
	before_action :set_questionnaire_option, only: [:show, :edit, :update, :destroy]

  # GET /questionnaire_options
  # GET /questionnaire_options.json
  def index
    @questionnaire_options = QuestionnaireOption.where(:job_id => params[:job_id]).order_by(:id)
    respond_to do |format|
      format.html
      format.json {render json: @questionnaire_options}
    end
  end

  # GET /questionnaire_options/1
  # GET /questionnaire_options/1.json
  def show
    respond_to do |format|
      format.html
      format.json {render json: @questionnaire_option}
    end
  end

  # GET /questionnaire_options/new
  def new
    @questionnaire_option = QuestionnaireOption.new
  end

  # GET /questionnaire_options/1/edit
  def edit
  end

  # POST /questionnaire_options
  # POST /questionnaire_options.json
  def create
    @questionnaire_option = QuestionnaireOption.new(questionnaire_option_params)

    respond_to do |format|
      if @questionnaire_option.save
        format.html { redirect_to "/questionnaires/#{@questionnaire_option.questionnaire_id}/edit", notice: 'QuestionnaireOption was successfully created.' }
        format.json { render :show, status: :created, location: @questionnaire_option }
      else
        format.html { render :new }
        format.json { render json: @questionnaire_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questionnaire_options/1
  # PATCH/PUT /questionnaire_options/1.json
  def update
    respond_to do |format|
      if @questionnaire_option.update(questionnaire_option_params)
        format.html { redirect_to "/questionnaires/#{@questionnaire_option.questionnaire_id}/edit", notice: 'QuestionnaireOption was successfully updated.' }
        format.json { render :show, status: :ok, location: @questionnaire_option }
      else
        format.html { render :edit }
        format.json { render json: @questionnaire_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionnaire_options/1
  # DELETE /questionnaire_options/1.json
  def destroy
    @questionnaire_option.destroy
    respond_to do |format|
      format.html { redirect_to "/questionnaires/#{@questionnaire_option.questionnaire_id}/edit", notice: 'QuestionnaireOption was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionnaire_option
      @questionnaire_option = QuestionnaireOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionnaire_option_params
      params[:questionnaire_option].permit(:questionnaire_id, :option, :isRight)
    end
end
