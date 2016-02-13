class QuestionnairesController < ApplicationController

  # GET /questionnaires
  # GET /questionnaires.json
  def index
    @questionnaires = Questionnaire.where(:job_id => params[:job_id]).order(:created_at)
    @job_id = params[:job_id]
    respond_to do |format|
      format.html
      format.json {render json: @questionnaires}
    end
  end

  # GET /questionnaires/1
  # GET /questionnaires/1.json
  def show
    respond_to do |format|
      format.html
      format.json {render json: @questionnaire}
    end
  end

  # GET /questionnaires/new
  def new
    @questionnaire = Questionnaire.new
  end

  # GET /questionnaires/1/edit
  def edit_questionnaires
    @questionnaires = Questionnaire.where(:job_id => params[:job_id]).order(:id)
    @job_id = params[:job_id]
  end

  # POST /questionnaires
  # POST /questionnaires.json
  def create
    @questionnaire = Questionnaire.new(questionnaire_params)

    respond_to do |format|
      if @questionnaire.save
        format.html { redirect_to "/edit_questionnaires?job_id=#{@questionnaire.job_id}", notice: 'Questionnaire was successfully created.' }
        format.json { render :show, status: :created, location: @questionnaire }
      else
        format.html { render :new }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questionnaires/1
  # PATCH/PUT /questionnaires/1.json
  def update
    @questionnaire = Questionnaire.find(params[:id])
    respond_to do |format|
      if @questionnaire.update(questionnaire_params)
        format.html { redirect_to "/edit_questionnaires?job_id=#{@questionnaire.job_id}", notice: 'Questionnaire was successfully updated.' }
        format.json { render :show, status: :ok, location: @questionnaire }
      else
        format.html { render :edit }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionnaires/1
  # DELETE /questionnaires/1.json
  def destroy
    @questionnaire = Questionnaire.find(params[:id])
    @questionnaire.destroy
    respond_to do |format|
      format.html { redirect_to "/edit_questionnaires?job_id=#{@questionnaire.job_id}", notice: 'Questionnaire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionnaire_params
      params[:questionnaire].permit(:id, :job_id, :question)
    end
end
