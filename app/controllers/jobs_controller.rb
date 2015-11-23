class JobsController < ApplicationController
  before_action :logged_in_user
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :set_job_applications, only: [:applications]

  # GET /jobs
  # GET /jobs.json
  def index
    if(params.has_key?(:filter_company))
        @arr = params[:filter_company].split(",")
        @jobs = Job.where(:company_id => @arr)
    end
    if(params.has_key?(:filter_industry))
        @arr = params[:filter_industry].split(",")
        if(@jobs == nil)
            @jobs = Job
        end
        @jobs = @jobs.where(:industry => @arr)
    end
    if(params.has_key?(:filter_location))
        @arr = params[:filter_location].split(",")
        if(@jobs == nil)
            @jobs = Job
        end
        @jobs = @jobs.where(:location_city => @arr)
    end
    if(params.has_key?(:filter_salary))
        @arr = params[:filter_salary].split(",")

        if(@jobs == nil)
            @jobs = Job
        end
        @res = JSON.parse('[]')
        @arr.each{ |e|
          @min_max = SalaryRange.find(e).title
          @min_max = @min_max.split(" - ")
          @filtered = @jobs.where(:salary_offered => @min_max.first .. @min_max.last) 
          if(!@filtered.blank?)
            if(@res == nil)
              @res = @filtered
            else
              @res = @res + @filtered
            end
          end
        }
        @jobs = @res

        # render text: @min_max.first
        # render text: @min_max
    end
    if(!params.has_key?(:filter_company) && !params.has_key?(:filter_location) && !params.has_key?(:filter_industry) && !params.has_key?(:filter_salary))
        @jobs = Job.where(:company_id => current_company.id).paginate(page: params[:page],:per_page => 10)
    end
    
    
    @salary_types = { "w" => "Weekly", "m" => "Monthly", "f" => "Fortnightly"}
    respond_to do |format|
      format.html
      format.json {render json: @jobs}
    end

  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    respond_to do |format|
      format.html
      format.json {render json: @job}
    end
  end

  def applications
    @salary_types = { "w" => "Weekly", "m" => "Monthly", "f" => "Fortnightly"}
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to jobs_url, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to jobs_url, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    def set_job_applications
      @job_applications = SavedAppliedJob.where(:job_id => Job.select(:id).where(:company_id => current_company.id)).paginate(page: params[:page],:per_page => 10)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:company_id, :title,:location_id,:postal_code,:industry_id,:salary_type,:salary_offered,:job_description,:contact_person_name,:contact_person_phone,:contact_person_email,:is_online)
    end
end
