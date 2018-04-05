class UserMailer < ApplicationMailer

  default from: 'Telemachus.Mentors@gmail.com'
  layout 'mailer'

  def welcome_email(user)
    @user = user
    @url  = 'Telemachus.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to Telemachus')

  end
end
