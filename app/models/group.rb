class Group < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :title, use: :slugged
	Paperclip.options[:command_path] = "C:\Program Files\ImageMagick-6.9.0-Q16"
	Paperclip.options[:command_path] = 'C:\Program Files (x86)\GnuWin32\bin'

	belongs_to :user
	has_many :members, :foreign_key => :group_id
	has_many :users, :through => :members
	
	
	has_attached_file :image, styles: { medium: "700x500#", small: "350x250#", thumbnail: "250x150#" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  	
	geocoded_by :address   
	after_validation :geocode 
		


  	
  		
  	
end
