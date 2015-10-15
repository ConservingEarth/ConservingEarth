class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception

  

  before_filter :configure_permitted_parameters, if: :devise_controller?

  helper_method :mailbox, :conversation


  
	  private

	  def mailbox
	    @mailbox ||= current_user.mailbox
	  end

	  def conversation
	    @conversation ||= mailbox.conversations.find(params[:id])
	  end

	  def user_not_authorized
	    flash[:alert] = "You are not authorized to perform this action."
	    redirect_to(request.referrer || root_path)
	  end

	protected

	def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up) << :name
	  devise_parameter_sanitizer.for(:account_update) << :name
	end
end