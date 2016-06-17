class Tag < ActiveRecord::Base
  has_many :show_id, through: :show_tags

  has_attached_file :image, styles: {
		thumb: "100x100>",
		medium: "300x300>"
	},

	default_url: "/images/tag_default.jpg"

	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	validates_presence_of :image
end
