class PairsMailer < ApplicationMailer

  default from: 'Telemachus.Mentors@gmail.com'
  layout 'mailer'

  def match_email(user)
    @user = user
    mail(to: @user, subject: "You've matched!")
  end
end
