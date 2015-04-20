class Post < ActiveRecord::Base
	Paperclip.options[:command_path] = "C:\Program Files\ImageMagick-6.9.0-Q16"
	Paperclip.options[:command_path] = 'C:\Program Files (x86)\GnuWin32\bin'
	acts_as_votable
	belongs_to :user
	has_many :infos
	has_many :comments

	has_attached_file :image, styles: { medium: "700x500#", small: "350x250#" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
