class Episode < ActiveRecord::Base

  belongs_to :show
  has_many :users, through: :likes
  has_many :contributors, through: :contributor_episodes

  has_attached_file :video, styles: {
  	mp4video: {
  		geometry: '400x360', format: 'flv',
  	},
  	preview: {
  		geometry: '300x300>', format: 'jpg', time: 10
  	}, 
  },
  procesors: [:transcoder], 
  storage: :s3,
  s3_credentials: {
    bucket: ENV['S3_BUCKET_NAME'],
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    s3_region: ENV['AWS_REGION'],
  }

  validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/  
  validates_attachment_file_name :video, matches: [/3gp\Z/, /mp4\Z/, /flv\Z/]  

  validates_presence_of :video

end
