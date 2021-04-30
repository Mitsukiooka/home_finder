class ApplicationNoticeMailer < ApplicationMailer
  default from: 'mooka@gmail.com'

  def notice_mail(owner, application)
    @owner = owner
    @application = application
    mail to: @owner.email, from: "mooka0907@gmail.com", subject: "#{@application.user_name}から申し込みがありました！"
  end
end
