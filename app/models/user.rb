class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :videos
  has_many :groups
  has_many :events
  has_many :infos, dependent: :destroy
  has_many :posts
  has_many :comments
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  has_many :members, :foreign_key => :user_id
  has_many :groups, :through => :members

  has_attached_file :avatar, styles: { medium: "200x200#", thumb: "100x100#" }, :default_url => ActionController::Base.helpers.asset_path('CElogo200.png')
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  
  acts_as_messageable

  enum role: [:inactive, :user, :mod, :admin, :global_admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end
  
end
