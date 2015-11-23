class SessionsController < ApplicationController
  def new
  end

  def create
  	
  	company = Company.find_by(email: params[:session][:email])
    if company && company.authenticate(params[:session][:password])
      # if company.activated?  
        log_in company
        params[:session][:remember_me] == '1' ? remember(company) : forget(company)
        # redirect_back_or company
        redirect_to jobs_url
      # else
      #   message  = "Account not activated. "
      #   message += "Check your email for the activation link."
      #   flash[:warning] = message
      #   redirect_to root_url
      # end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end

  end

  def destroy
  	log_out if logged_in?
    redirect_to root_url
  end
end
