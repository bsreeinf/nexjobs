class SessionsController < ApplicationController
  def new
  end

  def create
  	
  	company = Company.find_by(email: params[:session][:email])
    if company && company.authenticate(params[:session][:password])
      # if company.activated?  
        log_in company
        params[:session][:remember_me] == '1' ? remember(company) : forget(company)
        redirect_to jobs_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end

  end

  def destroy
  	log_out if logged_in?
    redirect_to root_url
  end

  def mobile_login
    @data = JSON.parse('{"status": "unknown"}')

    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      @data['status'] = 'success'
      @data['user_details'] = JSON.parse(user.to_json)
      @data['skills'] = JSON.parse(user.user_skills.to_json)
      @data['languages'] = JSON.parse(user.user_languages.to_json)
    else
      @data['status'] = 'failed'
    end
    respond_to do |format|
      format.html
      format.json {render json: @data}
    end
  end
end
