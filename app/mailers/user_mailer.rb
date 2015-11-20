class UserMailer < ApplicationMailer
	default from: "conservingearth@gmail.com"

  def registration_confirmation(user)
    @user = user
    mail(to: "#{user.name} <#{user.email}>", subject: 'Registered at Conserving Earth')
  end
end
