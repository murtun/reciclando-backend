require 'rails_helper'

RSpec.describe User, type: :model do
<<<<<<< HEAD
  describe 'validations' do
    let!(:organization) { FactoryBot.create(:organization) }
    let!(:user) { FactoryBot.build(:user, organization: organization) }

    it 'should let create new ones, with appropiate data' do
      expect(user).to be_valid
    end

    it 'should not let create new ones, with nil ci value' do
      user.ci = nil
      expect(user).not_to be_valid
    end

    it 'should not let create new ones, with nil name value' do
      user.name = nil
      expect(user).not_to be_valid
    end

    it 'should not let create new ones, with nil surname value' do
      user.surname = nil
      expect(user).not_to be_valid
    end
  end
=======
  pending "add some examples to (or delete) #{__FILE__}"
>>>>>>> Organization & User: +Model,+Controller,+Serializer,+Under active admin. Not done yet
end
