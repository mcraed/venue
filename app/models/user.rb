class User < ActiveRecord::Base

	has_many :episodes, through: :likes
	has_many :shows, through: :show_likes
	has_secure_password
	
	has_attached_file :avatar, styles: {
		thumb: "100x100>",
		medium: "300x300>"
	},

	default_url: "/images/user_default.jpg"

	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	validates :password, length: {minimum: 5}, allow_nil: true
	validates_confirmation_of :password
end
