class ApplicationController < ActionController::Base

include SessionsHelper



 private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end


  def compare_user(session_id, user_id)

  if session_id == user_id
  	true 
  else 
  	false 
  end
end 



end
