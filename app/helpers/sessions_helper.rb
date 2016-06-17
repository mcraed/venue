module SessionsHelper

	def login_user (user)
		session[:user_id] = user.id
		name = user.fname[0].capitalize + user.fname[1..-1]
		flash[:notice] = "Welcome to Venue, #{name}!"
	end

  def current_user
		current_user ||= User.find(session[:user_id])
	end

	def contributor_login(cont)
		session[:contributor_id] = cont_id
		name = cont.fname[0].capitalize + cont.fname[1..-1]
		flash[:notice] = "Welcome back, #{name}!"
	end

	def current_contributor
		current_contributor ||= Contributor.find(session[:contributor_id])
	end
	
end
