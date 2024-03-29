# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/welcome_mailer
class WelcomeMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/welcome_mailer/welcome
  def welcome
    WelcomeMailer.welcome(FactoryBot.create(:user))
  end
end
