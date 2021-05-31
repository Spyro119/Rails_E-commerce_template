require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "is not valid without email" do
    user = User.new(email: nil)
    expect(user).to raise_exception
  end
end
