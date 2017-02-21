# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'


RSpec.describe User, type: :model do
  subject(:user) do User.new(username: "User", password: "password")
  end

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should have_many(:goals) }
  it { should have_many(:comments) }


  describe "::find_by_credentials" do
    before { user.save! }
      it "finds users by credentials" do

        expect(User.find_by_credentials("User", "password")).to eq(user)
      end
    end

end
