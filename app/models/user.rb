class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :videos
  has_many :groups
  has_many :infos, dependent: :destroy
  has_many :posts
  has_many :comments
 

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
