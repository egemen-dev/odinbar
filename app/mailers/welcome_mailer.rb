class WelcomeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.welcome.subject
  #
  def welcome(user)
    @user = user
    @username = @user.username

    mail to: @user.email,
         subject: "Welcome to Odinbar"
  end
end
