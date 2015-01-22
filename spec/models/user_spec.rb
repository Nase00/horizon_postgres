require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { User.new(username: "Sean", email: 'test@test.test', twitter: 'space', facebook: 'Whee')}

  describe "validates presence" do
    it { expect(user).to validate_presence_of(:username) }
    it { expect(user).to validate_presence_of(:email) }
    it { expect(user).to validate_presence_of(:password) }
  end

  # describe "validates uniqueness" do
  #   it { expect(user).to validate_uniqueness_of(:username) }
  #   it { expect(user).to validate_uniqueness_of(:email) }
  # end

  # describe "excepts associations" do
  #   it { expect(user).to have_many(:) }
  # end

  describe "restricts email format" do
    it { expect(user).to allow_value('text@email.com').for(:email) }
    it { expect(user).to_not allow_value('textemail.com').for(:email) }
    it { expect(user).to_not allow_value('text@emailcom').for(:email) }
  end

  describe "restricts username format" do
    it { expect(user).to allow_value('username').for(:username) }
    it { expect(user).to_not allow_value('user name').for(:username) }
    it { expect(user).to_not allow_value(' ').for(:username) }
  end

  describe "has secure password" do
    it { expect(user).to have_secure_password }
  end
end