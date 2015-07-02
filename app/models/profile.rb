class Profile < ActiveRecord::Base
	validates :name, presence: true
	belongs_to :user
	 has_attached_file :avatar, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
	  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	  has_attached_file :cover_photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  		validates_attachment_content_type :cover_photo, :content_type => /\Aimage\/.*\Z/
end
