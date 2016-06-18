class Show < ActiveRecord::Base
	has_many :tags, through: :show_tags   
	has_many :episodes 
	has_many :users, through: :show_likes
	has_many :contributors, through: :contributor_shows

	accepts_nested_attributes_for :episodes
	
	has_attached_file :image, styles: {
		thumb: "100x100>",
		medium: "300x300>"
	}, 

	default_url: "/images/show_default.jpg"

	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	validates_presence_of :image
end
