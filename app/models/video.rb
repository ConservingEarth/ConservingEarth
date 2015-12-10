class Video < ActiveRecord::Base
	Paperclip.options[:command_path] = "C:\Program Files\ImageMagick-6.9.0-Q16"
	Paperclip.options[:command_path] = 'C:\Program Files (x86)\GnuWin32\bin'
	acts_as_votable
	belongs_to :user
	has_many :infos
	has_many :comments

	has_attached_file :image, styles: { medium: "700x500#", small: "350x250#" }, :default_url => ActionController::Base.helpers.asset_path('CElogo200.png')
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


  	validates :link, :on => :create, :presence => true, :uniqueness => true, format: { with: /\A(https?):\/\/(www.)?(youtube\.com\/watch\?v=|youtu\.be\/)([A-Za-z0-9_-]*)(\&\S+)?.*/,
    message: "Only Youtube is allowed" }
end
