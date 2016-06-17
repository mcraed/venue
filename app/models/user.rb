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
	validates_presence_of :avatar
	validates_confirmation_of :password
	validates_presence_of :password, on: :create
end
