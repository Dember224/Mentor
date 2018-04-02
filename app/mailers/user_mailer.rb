class UserMailer < ApplicationMailer

  default from: 'Telemachus.Mentors@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://www.gmail.com'
    mail(to: @user.email, subject: 'Welcome to Telemachus')

  end
end
