require 'rails_helper'

FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name  { "Doe" }
    username { "John_Doe"}
    is_admin { false }
    password {"VeryStrongPassword123"}
    email {"something@outlook.com"}
  end
end

RSpec.describe User, type: :model do
  id = 1, 
  username = "Attribute_testing"
  first_name = "Attribute"
  last_name = "Tests"
  created_at = DateTime.now
  updated_at = DateTime.now
  password = "VeryStrongPassword123"
  # pending "add some examples to (or delete) #{__FILE__}"

  # E-mail whitelisting
  it "Outlook email should be whitelisted" do
    user = create(:user)
    expect(user).to be_valid
  end

  it "Gmail email should be whitelisted" do
    user = User.new( id: 3, username: "#{username}2", first_name: first_name, password: password, last_name: last_name, email: "something@gmail.com" )
    expect(user).to be_valid
  end

  # Validation
  it "Should validate uniqueness of username" do 
    user = create(:user)
    # @user = Factory(:user)
    should validate_uniqueness_of(:username)
  end

end
