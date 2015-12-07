require 'rails_helper'
require 'spec_helper'

RSpec.describe "Message", :type => :model do
  describe "initialize" do
    before(:each) do
      @user = User.create!(username: "test1234", password: "test1234")
    end
    it "sets read state to false upon creation" do
      message = Message.create!(title: "test", creator: @user, recipient: @user)
      expect(message.read).to be(false)
    end
  end
end