class MessageMailer < ApplicationMailer

  default from: 'Telemachus.Mentors@gmail.com'
  layout 'mailer'

  def message_email(user)
    @user = user

    @sent_message = if Message.where(:from => User.find_by_email(@user).id).last != nil
       Message.where(:from => User.find_by_email(@user).id).last.message
    else
       Message.where(:from => User.find_by_email(@user).id).message
    end

    mail(to: @user, subject: "New message on Telemachus")


  end
end
