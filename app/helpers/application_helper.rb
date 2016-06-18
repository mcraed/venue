module ApplicationHelper

	# def login_user(user)
	# 	session[:user_id] = user.id	
	# 	flash[:notice] = "Welcome to Venue!"
	# end

 #  def current_user
	# 	current_user ||= User.where(id: session[:user_id]).last
	# end

	# def contributor_login(cont)
	# 	session[:contributor_id] = cont.id
	# 	flash[:notice] = "Welcome back!"
	# end

	def current_contributor
		current_contributor ||= Contributor.where(id: session[:contributor_id]).last
	end

	def fullname(x)
		"#{x.fname}" + " " + "#{x.lname}"
	end
end
