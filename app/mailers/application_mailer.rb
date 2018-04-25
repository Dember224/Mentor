class ApplicationMailer < ActionMailer::Base
  default from: 'Telemachus.Mentors@gmail.com'
  layout 'mailer'

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
