module SessionsHelper

	def login_user(user)
		session[:user_id] = user.id
		name = user.fname[0].capitalize + user.fname[1..-1]
		flash[:notice] = "Glad you could make it, #{name}!"
	end

  def current_user
		current_user ||= User.where(id: session[:user_id]).last
	end

	def contributor_login(cont)
		session[:contributor_id] = cont.id
		name = cont.fname[0].capitalize + cont.fname[1..-1]
		flash[:notice] = "Glad you could make it, #{name}!"
	end

	def current_contributor
		current_contributor ||= Contributor.where(id: session[:contributor_id]).last
	end
	
end
