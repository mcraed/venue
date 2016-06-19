class ContributorShow < ActiveRecord::Base
	belongs_to :contributor
	belongs_to :show
end
