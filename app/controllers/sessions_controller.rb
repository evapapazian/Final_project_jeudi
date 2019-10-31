class SessionsController < ApplicationController


	def new 
		#@session = Session.new
	end


	def create 
		user = User.find_by(email: params[:email])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to gossips_path

		else 
			flash.now[:danger] = 'Combinaison email/password invalide'
			render 'new'
		end
	end 



	def destroy
	session.delete(:user_id)
	redirect_to gossips_path
	end
end
