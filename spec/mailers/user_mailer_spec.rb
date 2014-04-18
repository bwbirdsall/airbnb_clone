require "spec_helper"

describe UserMailer do
  describe "signup_confirmation" do
    let(:mail) { UserMailer.signup_confirmation(@user) }

    it "renders the headers" do
      @user = FactoryGirl.build(:user)
      mail.subject.should eq("Welcome to GlobalFriends™")
      mail.to.should eq([@user.email])
      mail.from.should eq(["allofushere@globalfriends.net"])
    end

    it "renders the body" do
      @user = FactoryGirl.build(:user)
      mail.body.encoded.should match("<p>Welcome #{@user.username},</p>\r\n\r\n<p>Thanks for joining the GlobalFriend™ Club!  You are a REAL friend, #{@user.username}!</p>\r\n\r\n<p><a href=\"http://localhost:3000/\">Visit Your Friends at GlobalFriend™!</a></p>\r\n\r\n\r\n")
    end
  end

end
