require 'rails_helper'
require 'spec_helper'

RSpec.describe "User", :type => :model do
    describe "password encryption" do
        it "does not save passwords to the database" do
            User.create!(username: "test_user", password: "test_password")
            user = User.find_by_login_credentials("test_user", "test_password")
            expect(user.password_hash).not_to be("test_password")
            # expect(user.password).not_to be("test_password")
        end
    end
end