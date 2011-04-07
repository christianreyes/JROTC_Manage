class Feedback < ActionMailer::Base
  default :from => "jrotcmanage@gmail.com"
  
  def feedback_message(feedback)
  @feedback = feedback
   	mail(:from => @feedback[:email], 
	     :to => "jrotcmanage@gmail.com",
		 :subject => "AUTO: Feedback from website")
  end
end
