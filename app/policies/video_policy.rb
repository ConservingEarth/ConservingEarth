class VideoPolicy
  attr_reader :current_user, :video

  def initialize(current_user, video)
    @current_user = current_user
    @video = video
  end

  def index?
  		
  end
   def edit?
   
  end

   def update?
    
  end

  def destroy?
   
  end
end