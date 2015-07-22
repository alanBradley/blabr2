class Profile < ActiveRecord::Base
  belongs_to :user

  has_attached_file :avatar, styles: { medium: "400x400#", thumb: "400x400>" }
  # avatar regex here for validation on content_type
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  	# validation set up so no errors appear for missing information
  	validates :firstname, :lastname, :avatar, :bio, :gender, :city, presence: true

end
