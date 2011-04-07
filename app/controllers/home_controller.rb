class HomeController < ApplicationController
  def index
  end
  
  def feedback
    @feedback = { :email => params["email"], :name => params["name"], :message => params["message"] }
	Feedback.feedback_message(@feedback).deliver
	
	respond_to do |format|
      format.js { render :json => "success" } 
    end
  end
end
