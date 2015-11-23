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
        
        @data['education_list']     = JSON.parse(Qualification.all.to_json)
        @data['skills_list']        = JSON.parse(Skill.all.to_json)
        @data['language_list']      = JSON.parse(Language.all.to_json)
        @data['location_list']      = JSON.parse(Location.all.to_json)
        @data['salary_range_list']  = JSON.parse(SalaryRange.all.to_json)
        @data['industry_list']      = JSON.parse(Industry.all.to_json)
        @data['company_list']       = JSON.parse(Company.all.to_json)

    end

end
