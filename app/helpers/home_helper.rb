module HomeHelper
	def all_contributors
		@contributors = Contributor.all
	end
end
