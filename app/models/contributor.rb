class Contributor < ActiveRecord::Base
	has_many :contributor_shows, class_name: ContributorShow
	has_many :shows, through: :contributor_shows
	has_many :episodes, through: :contrubutor_episodes
	has_secure_password

	has_attached_file :avatar, styles: {
		thumb: "230x230>",
		medium: "300x300>"
	},

	 default_url: "/images/contributor_default.jpg"

	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	validates :password, length: {minimum: 5}, allow_nil: true
	validates_confirmation_of :password
end
