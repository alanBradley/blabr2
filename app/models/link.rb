class Link < ActiveRecord::Base
	# searchkick added to model Link for search functionality through Gem
	searchkick
	
	# acts_as_votable added to model Link for voting functionality on each link
	acts_as_votable

	# associations
	belongs_to :user
	has_many :comments
	has_attached_file :image, styles: { medium: "400x400#", thumb: "400x400>" }
	
	# image regex here for validation on content_type
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  	# if the link is destroyed than the location dependent upon it is deleted
  	has_many :locations, :dependent => :destroy
  	# nested form helper to accept locations fields in links form
  	accepts_nested_attributes_for :locations

	# validation set up so no errors appear for missing information
  	validates :title, :url, :image, presence: true

end
