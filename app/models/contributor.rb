class Contributor < ActiveRecord::Base
	has_many :Episodes, through: :contrubutor_episodes
	has_many :shows, through: :contributor_shows

	has_attached_file :avatar, styles: {
		thumb: "100x100>",
		medium: "300x300>"
	},

	 default_url: "/images/contributor_default.jpg"

	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	validates_presence_of :avatar
end
