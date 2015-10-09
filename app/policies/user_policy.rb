class UserPolicy
  attr_reader :current_user, :post

  def initialize(current_user, post)
    @current_user = current_user
    @post = post
  end

  def index?
  		
  end

  def update?
    current_user.admin? or not post.published?
  end


end