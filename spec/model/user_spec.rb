require 'rails_helper'
require 'spec_helper'

RSpec.describe "User", :type => :model do
  describe "password encryption" do
    it "does not save passwords to the database" do
      User.create!(username: "test_user", password: "test_password")
      user = User.find_by_username("test_user")
      expect(user.password).not_to be("test_password")
    end

    it "encrypts the password using BCrypt" do
      expect(BCrypt::Password).to receive(:create)
      User.new(username: "test_user", password: "test_password")
    end
  end
end