class InitController < ApplicationController
	before_action :init_data

  # GET /init
  def index
    render json: @data
  end

  private

  	def init_data
  		@ppp = User.select([:id, :name, :email])
    	@data = JSON.parse('{"status": "success"}')
        
        @data['education_list']     = JSON.parse(Qualification.all.select(:id, :description).to_json)
        @data['skills_list']        = JSON.parse(Skill.all.select(:id, :description).to_json)
        @data['language_list']      = JSON.parse(Language.all.select(:id, :description).to_json)
        @data['location_list']      = JSON.parse(Location.all.select(:id, :description).to_json)
        @data['job_type_list']      = JSON.parse(JobType.all.select(:id, :description).to_json)
        @data['salary_range_list']  = JSON.parse(SalaryRange.all.select(:id, :min_amount, :max_amount).to_json)
        @data['industry_list']      = JSON.parse(Industry.all.select(:id, :description).to_json)

        @arr = JSON.parse(Company.all.select(:id, :name, :phone, :email, :address).to_json)
        @arr.each{ |e|
          e[:logo] = Company.find(id: e.id).logo.url
        }
        @data['company_list']       = (@arr)

    end

end
