class GroupPolicy
  attr_reader :current_user, :group

  def initialize(current_user, group)
    @current_user = current_user
    @group = group
  end

  def index?
  		
  end

  def update?
    
  end


end