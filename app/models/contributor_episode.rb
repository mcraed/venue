class ContributorEpisode < ActiveRecord::Base
	belongs_to :contributor
	belongs_to :episode
end
