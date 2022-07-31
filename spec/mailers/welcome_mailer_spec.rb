require "rails_helper"

RSpec.describe WelcomeMailer, type: :mailer do
  describe "welcome" do
    let(:mail) { WelcomeMailer.welcome(FactoryBot.create(:user)) }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome to Odinbar")
      expect(mail.to).to eq(["testerjoe@gmail.com"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
