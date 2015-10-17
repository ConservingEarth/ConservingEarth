class VideoPolicy
  attr_reader :current_user, :video

  def initialize(current_user, video)
    @current_user = current_user
    @video = video
  end

  def index?
    @current_user.user?
  end

  def show?
    @current_user.user?
  end
   def edit?
    @current_user == @video
  end

   def update?
    @current_user == @video
  end

  def destroy?
   @current_user == @video
  end
end